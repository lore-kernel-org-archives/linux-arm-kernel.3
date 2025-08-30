Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF907CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 13:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Wkx0s3ceZ1hfkSo00gMyByhOeGtiM2HLNss7D9J4VA=; b=b5iw9QddjDCQ8RxYZiAd5VyeY/
	MOKAeVGbd49FspI2jSXwSrnJeCAyP3UJv5sNd2gDIlsSVA2VY1uTlGazojapBPAmKgffwS7AhvjSn
	OKYzUXkdEz6jZ7QYqr3ApAqJKe/Rri/zf64yxFdJRPT85Ao7sKrUJxhnuFw/UUprBFqcywFYIR0u3
	Q44SNHocu+HaU4b5tE0vka7jwVNciA7zFcX2HPvOuUyjypMbjpICcYFIA7WIbLcZpqUdIAvtl8gx3
	KJE3r9M/5z11coe4ssbj/HhUn1/pgpxYksa07BRWfwBIpjglvDs9KpM227+Dnay5vb5cX6joZ8PID
	q6uWdU5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usLD6-00000007tqN-2Drh;
	Sat, 30 Aug 2025 13:01:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usL9h-00000007t2G-3USi;
	Sat, 30 Aug 2025 12:58:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=4Wkx0s3ceZ1hfkSo00gMyByhOeGtiM2HLNss7D9J4VA=; b=mfFmsgrhnBXM4d8ogI54ClxhmP
	X41S+1H45/Ofk+JkQmMAd81GQzUvwRjx6RNYm8UpCSr0UPnONryAY9sbv78Ht/0/40ED7UoZdcHK/
	r7OiFfVlQPRekl5KdaU9+kvRh4KYyr7+RO/aJTYR5i/gq7Fau/dcvsdNsSZ4mJ6T5iGtrWoUFN8aD
	gYAm8ftVr8qLFvFSnbQ8o6o+xUVQtB7OWWzwUXRRTY8QNJsNDy4OVGEfclHpBjjKT8jZuFLD1t6U5
	rN4dEMaLJj6wFKYLa8jIckrG4wFX0CDbXknjGOB7XlsGPoFMVnRJ46ThK1Wamc+7y/mqCpmhw9ovv
	vNbrgqPw==;
Received: from [77.241.232.9] (helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1usL9f-0007bC-2I; Sat, 30 Aug 2025 14:58:03 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Christian Hewitt <christianshewitt@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Alex Bee <knaerzche@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: add SPDIF audio to Beelink A1
Date: Sat, 30 Aug 2025 14:57:52 +0200
Message-ID: <175655867260.3578496.8687681480867378728.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250828164300.3829488-1-christianshewitt@gmail.com>
References: <20250828164300.3829488-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_055805_906506_82BB95A3 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Thu, 28 Aug 2025 16:43:00 +0000, Christian Hewitt wrote:
> Add the required nodes to enable SPDIF audio output on
> the Beelink A1 set-top-box.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: add SPDIF audio to Beelink A1
      commit: 8a449a728cce86183f93a3d1812c94509359719c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

