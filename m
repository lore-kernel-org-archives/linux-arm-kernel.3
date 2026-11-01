Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562ED606F2DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CTGfvSsB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=H0LyhZYG;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=uEV+UsRF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jNvebCA3UqtmaXBwksfo8idH4tYB1vvNqeOjeRCYRLI=; b=CTGfvSsBZeyk4R
	zXEJ1zxcd2/6oMv97deosnvyxW75nn7QhTJh3eCDSRiMJmwMwfFWvWEFn8mpIC34eV7thG4nd56Ji
	vCcdYYqO1in7tZnMh+ZIKQgXymild4thxTbKbTlo3jE6AhB/YlYalxcUXXqsg/S7QYqINEaUY30I5
	xycRZ1ZLtJl7n8fdKqsC4Pp1fCL3sEuwMGmnD0GIkmT++s9YmZJqxfvOtZSNoXGUqfwdeO3cqIlrf
	ZC6v4owZmoFBYtTyoXwzse927vogskDiyc0ZaEiuAx9XYOtOi1Q2tv9Qz7L7Gv1St10k5MBR0aOy4
	jMrvXOEzlXBAYpYBJKuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrR-0000000F2Rc-2eNJ;
	Sun, 01 Nov 2026 22:17:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdr2-0000000F10P-0UXl;
	Sun, 01 Nov 2026 22:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jNvebCA3UqtmaXBwksfo8idH4tYB1vvNqeOjeRCYRLI=; b=H0LyhZYGF879dlzDOqxbNjzF3U
	/+BnS3mWZ/IfRoE1fOgm/u684yAl15UqRGMx+rdqwWj2Kpcs4pItrRrL9Zfk3K9Eul/OBMvVEzOUm
	qs5YYx7WvdOgZPmfdm5SUQQrFmMVRT/nlIMzKWnJlCfDlIV1gI+5VrwS+mTCcObWXm7HmUCyvYv3p
	c5RIQakG8GriJcW3hrFBIZUrFeQvoaxQPZMkZQC/mlMT0KlMMKBbXAeAA5JuU3pKCNJw/GF0SfV6j
	M51klgydnxhSTDJQuAZMCe9v27DOUR7cCrtaaXLJfKgBxb9KZu/B88EAjgeOxz8F3jyUWloA8Gos4
	FwdDMayw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqi-00000001ses-0PnN;
	Sun, 01 Nov 2026 22:16:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=jNvebCA3UqtmaXBwksfo8idH4tYB1vvNqeOjeRCYRLI=; b=uEV+UsRFNWzPJQZRmavo5i76In
	igSrs0bex1SvT62OPJ1IMUCWBWhTpjvsA5S7TQT88E6RhmTnAS0uY/x/8/j5wUDeZZqEUChNaPuCs
	P0CyF4WStwddXCr2k56WyZqINmDrJnzdekvMMJAFAVWwhH06V1gYy2ppolsZ80LA+RdjfVsZw5KWh
	BW3WtwCM2JcxdYqTC4TJp6KWyz8TUDLWtKpNOV14EqNglguptmAzvb50mFjlKZn41siQwx9DtqZj5
	ogF650wsbfNJR+A9GfCCY34iQXdU5Xli7M6Y0UeS26B3eIo9ycbb+ypfrCBnCMd6uNMWW85PXMWsi
	yCW3HNpg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Miguel Jesus Seron Gonzalez <info@gluon.es>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dongjin Kim <tobetter@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: odroid-m1: keep vcc3v3_pcie enabled from boot
Date: Sun,  1 Nov 2026 23:16:09 +0100
Message-ID: <179357136501.4108155.9270952989405440142.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019132458.855-1-info@gluon.es>
References: <20261019132458.855-1-info@gluon.es>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_221625_494579_C8F83EC7 
X-CRM114-Status: GOOD (  11.94  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Mon, 19 Oct 2026 15:24:58 +0200, Miguel Jesus Seron Gonzalez wrote:
> The 3.3V supply of the M.2 slot is a GPIO-controlled fixed regulator
> without regulator-boot-on. When the regulator driver probes, it
> requests the enable GPIO as low, cutting power to an NVMe drive that
> the bootloader has already powered up and used. When the PCIe
> controller is built in, it probes a few milliseconds later and
> re-enables the supply. The drive therefore sees a brief power glitch
> without enough time to fully discharge.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: odroid-m1: keep vcc3v3_pcie enabled from boot
      commit: ff9ff0e5e40dde8e7d769c86d8314b37b323cac7

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

