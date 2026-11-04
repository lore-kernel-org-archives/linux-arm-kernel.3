Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211E3606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 22:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GAJ3Wcmw;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=BYGnZrOn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hfEBpFMF8c5rPBNt+LYZXTPFb+iq379xlL3xl7YzuZI=; b=GAJ3WcmwD7nAiW
	31UN7ZufO+kdZTMQrh84WePb5083JiHu6vCcRdjUdhK9iYWTNVk/krrbGDZIBLVVvJzeEOmwxlJjY
	o+ccIIkGGIvQCNBHLAzsNYyt4XyUS/PAzikCIQ29I8rUzRyaD0WtiaYrYF1zj6bGIUCOyDSTjSzeB
	mokGHagLviIFEkNPvvDyRq3T8ZSYEZ4igFZKByeyxiEEBDVlw0+5/CQe6G44dDmpEpSSroZUSgO88
	vIPNRCoZ5URNF8Ps5Su7g5UelLycQhxvdE/AqMKTS2RdzYUPPZm7MNmiKpsVIdbm/yR+MomhjCGsH
	Uoej9ItQiFebMvrwC1ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOjiM-00000007At5-3wXK;
	Wed, 04 Nov 2026 22:44:18 +0000
Received: from sender-op-o17.zoho.eu ([136.143.169.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOjiJ-00000007AsV-0zvQ;
	Wed, 04 Nov 2026 22:44:17 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793832249; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=czcY0hthCcdpo/TlC7/oZP4c135oFGtQ2rnKgsYDTGav7RHuFWvzSIB8gBH+4RqdF8p3m8thmeULrUAHhoTL7ier9zAPyzgvlbZiyXTAgp/rXnyN/plx4tk0+gHb1P1tRV6nP1YrB+v5WIXaz+VmKoprHzQS1yIjVuaqFXFA1Pk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1793832249; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hfEBpFMF8c5rPBNt+LYZXTPFb+iq379xlL3xl7YzuZI=; 
	b=Q34j5cG7k69XSj0S0HCHtiAe/peBNU75X9Aiz2NvI1AAlUD5GqTJLP5kE8EZocGWbAcXKK3csinOTR7jxcIgwVUkPErq+GIP8Bs6+gj+8mrh83nXALy74OZhf0Twet/xhwHre1Gf1qaAcw5AHiDBkgse4uoX0ZhBPVKdkN/WAiM=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=BYGnZrOnNsNC8iSfDlWmzPc8iCkDgbyVP6wke9/Tg6vGPoDBXjKcMBHOrIgEaZOBnlLUWq/3MxG4ZLYhfmnTpuistWJZqMH8GjbPJhzTa8wU+YNAAt5fRY90rc0Yujiym9mf5TAXC22v6wvJcJhTx57MXLcuvbsIw9GNv1S7Lzo=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=hfEBpFMF8c5rPBNt+LYZXTPFb+iq379xlL3xl7YzuZI=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1793832247813832.2603239285348;
	Wed, 4 Nov 2026 23:44:07 +0100 (CET)
Date: Thu, 05 Nov 2026 00:44:06 +0200
From: Igor Velkov <iav@iav.lv>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: iav@iav.lv, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>,
 Shawn Lin <shawn.lin@rock-chips.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Alexey Charkov <alchark@flipper.net>, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v7 00/10] PCI: dw-rockchip: add system suspend support
Message-ID: <20261105-dw-rockchip-suspend-v7-tested-by-1@iav.lv>
In-Reply-To: <20261104-rockchip-pcie-system-suspend-v7-0-6ae6875939a2@collabora.com>
References: <20261104-rockchip-pcie-system-suspend-v7-0-6ae6875939a2@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_144415_553300_995BFAA6 
X-CRM114-Status: UNSURE (   5.96  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested on ODROID-M1 (RK3568, NVMe on pcie3x2) with 7.3.1, Jonas'
EHCI/OHCI clock patch and f845c1e2d2d4 ("PCI: dwc: Add suspend_poweroff
flag for platforms with RC power loss") backported: s2idle 10/10,
deep 10/10, the NVMe stays usable after resume.

Tested-by: Igor Velkov <iav@iav.lv>

