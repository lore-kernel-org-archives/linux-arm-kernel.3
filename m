Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB086606A334
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0OSNGzO9;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=p3eIOyeN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=n3w1Fl6SJMp1kr9973CPt7D/UB+btgvPCLo7vh9GdrE=; b=0OSNGzO94ircbV
	+l6yi6+4qX8iP+zetc9CSjVfAZJOGQAbqE059zoNsaRAfe2cZ1+zXKsQvUN6bbXdnGL8HGN4z3El4
	DTFBUO41ZjbtXk7zbBKLLdmtx6hFt3G+Nht33+sex6ZVImLBQ2800AhDB0QO+nlIrAmnCyCaCOAD/
	V7zR0T9XN1mjZP1RrhcmgGYArBHOm9E13PfVmy882VRs1Z2bt7oZIp5w7cxnM94KHtG/lH1CUZied
	XAiC8ldZaZEPd9QxX7yJUkNH6mhQUhNUI852dOLsbcLHxu74iRUbGGG9PJbyDSBr+QoK9JSnN1QAN
	kROt7geMBklSMfQ71mWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrq-0000000F3q3-0Uox;
	Sun, 01 Nov 2026 22:17:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdr5-0000000F0Xu-3YWW;
	Sun, 01 Nov 2026 22:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=n3w1Fl6SJMp1kr9973CPt7D/UB+btgvPCLo7vh9GdrE=; b=p3eIOyeNLwKdvGgs0DrdVSQ8AN
	pIrjanYCEEVzJtZkLgPuQekvVXx/BUa0ZfyE+6Z9T5DGD+P1gkPZoLHl/7w8blOWDd0HAiHdrSbKA
	C07nlsh2JRBJ6gwFymecy1OJIpZVJLHwnV6Ov78hzlianq2McrvIBDlR7oazvu20VMT7esI7ZOYip
	YYwScpE5Tf5tf4L/fcgXcMkGFcQ3q+0p2ea/DGT3NZyjGCxItglsSMJEYtNPkNScw2OEqIKyzE0+R
	eNqyM5/iJGS/8dLRjMKoDfeTZBMxJih72F47iHoaJ95WOQ9Cuf8ppbd/IZK4Bag1wC3t+/plqYb7N
	ZjnAyqyA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	Alexey Charkov <alchark@gmail.com>,
	Kel Modderman <kelvmod@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: Fix Orange Pi 5 Pro headphone output
Date: Sun,  1 Nov 2026 23:16:32 +0100
Message-ID: <179357139327.4108484.4012953822270877213.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261018-opi5pro-amp-v1-0-05c84e91bf6d@gmail.com>
References: <20261018-opi5pro-amp-v1-0-05c84e91bf6d@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_141647_959356_7D1C3DF4 
X-CRM114-Status: GOOD (  11.09  )
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sun, 18 Oct 2026 16:35:29 +1000, Kel Modderman wrote:
> The Orange Pi 5 Pro inherits vcc_3v3_sd_s0 from the shared
> rk3588s-orangepi-5.dtsi, but on the Pro GPIO4_B5 does not switch SD card
> power: it enables the headphone amplifier. With the regulator claiming
> the pin, the amplifier stays off and the headphone jack is silent.
> 
> Patch 1 moves the regulator and the sdmmc vmmc-supply into
> rk3588s-orangepi-5-5b.dtsi, which only the 5 and 5B include. The
> compiled 5 and 5B DTBs have the same nodes and properties as before.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Move SD card regulator to Orange Pi 5/5B
      commit: 7fad20ae8bf8e289cb6423d68ef4f0d67f4a33c5
[2/2] arm64: dts: rockchip: Add headphone amplifier to Orange Pi 5 Pro
      commit: f21e9ddb7415eb60a404297e2a44fa23243fd2d4

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

