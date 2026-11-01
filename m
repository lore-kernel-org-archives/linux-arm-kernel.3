Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EA760A2601
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qhuq/4Sh;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=TuQNWuUN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/rAbfbo0sbqC0IaBa1BlKo2l+kbF0qrFhj597CNVJsw=; b=qhuq/4Sha5czTD
	N/F5wHWUEa1jn4zz43LEkB+VjKB5+qeNVBijrtmuE1JcLaJmArCUE3gKtdq9lnUtxZkPlUEtvqsM1
	Ka5awocMY3nV/WhCYKz0MtKjXVn+ttIBrCeWBt0nrO7HUDGlqXYa01RMAvDat73BohFbI458F8bAb
	OHlInFUHHCrkCjWLBsGdWs76SmVYVJNC57bqa6UhyyZT7TPWsrVztv/p289SuUhX319kMTyXGa+m5
	93Qm579eu68o0HzrnZmudgP7qPw6zOyAgEmyltsSkZgYjZYYD4TApJK0/MAnqRB99qmtnTm4iCqNs
	iLIp97illk34zRlyWQjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqE-0000000EyxN-38Wt;
	Sun, 01 Nov 2026 22:15:54 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdq6-0000000EynD-49kh;
	Sun, 01 Nov 2026 22:15:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=/rAbfbo0sbqC0IaBa1BlKo2l+kbF0qrFhj597CNVJsw=; b=TuQNWuUNzCW8lMfyzUY6T/5Ggu
	P85UjS1z5Ss/B5adnOY+BkFcLgtqEkuf7HHZMLWTX4y2P/WbcaPxvsemvwkdaP53jYKdu/QfWEouM
	JX8hgVJWbC+Fw1rNnUav7G0IDtgcuNxOPcOQGr6+sCckggx0fIhFNBA0kxioK+rQRMX4wVvaf8apn
	9mn7nDlVEOo6mZAznz/mCwVrjsJ6WaRTDFLBpDVmXUJfAC0kyCdE/M2rBMw52ZA/RXNtUFEWbFfEr
	ZXHE785PZrk5SQszDTEgChlVfv9F46qFMnZ5O8xD83qEb2KvwqUeX4puFoKY9ndsTYj3C4Uf38zAe
	JKwnlxcw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Igor Velkov <iav@iav.lv>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add the buzzer to Kobol Helios64
Date: Sun,  1 Nov 2026 23:15:23 +0100
Message-ID: <179357131397.4107717.15989067428088831380.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010-b4-helios64-beeper-v1-1-6235643158cf@iav.lv>
References: <20261010-b4-helios64-beeper-v1-1-6235643158cf@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_141547_039807_BD253B9C 
X-CRM114-Status: UNSURE (   9.75  )
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sat, 10 Oct 2026 23:00:16 +0300, Igor Velkov wrote:
> Helios64 has a 2-pin header, P4, for an external buzzer: pin 1 is 5 V,
> pin 2 is switched to ground by a MOSFET driven from GPIO4_D3
> (BUZZER_ON), active high. Describe it as a gpio-beeper.

Applied, thanks!

[1/1] arm64: dts: rockchip: Add the buzzer to Kobol Helios64
      commit: 1f8c17240e23a37072793267cbb64587f24d4f2f

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

