Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3438CD98FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 23:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JL+VtOL6DYJB3NAllQYSZj9/uY1KVCe8b5VDpBtERJA=; b=JmT2Iu1AH7thxc+KjOeC+Wed8F
	GPdxLkuKCoGeJm+in0baaP0vJpRqL5LDp2mWHFMM/3ueV0QXqWeigEj2oBtXhammg6Nf4eZ9gSMje
	rBagqnB8EVZTMJxGPr301hwTgDRMnxUpF656p5QkW8LJMONGoeMdMgi+K7iDCNHxPdGqcyNgFuKg7
	A8jm1jOFw1rOe49pNaAL+QxxF6ZtjHuKEKooGylssAt8OQvoTZdfCicS/tbs4qtRpZTB6S/jS+jdX
	xdMoIiDvdJ6odlOZAYghHhy6BSjTIjr0oHp3FLCOUFetUhJWRCUNzR2Vz3zKebLP7VG6ZYC4jL0fL
	Kr08ZmLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgMp-0000000BECn-3IHO;
	Thu, 13 Nov 2025 23:04:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgMn-0000000BEAz-2uKr;
	Thu, 13 Nov 2025 23:04:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=JL+VtOL6DYJB3NAllQYSZj9/uY1KVCe8b5VDpBtERJA=; b=yJAebDMBYxRxvsjq7HcGgwGhab
	CaBNingfZ7PauQaZGjSlGXGCjl4pVpfGghExv9zRRkxVK7IxnwiVBzMTaItieCqcedIEBnP172M4F
	boOLWbfiz4IdL0msn0qn++ZWacacS9krRdAjXVkiI52mH7SrKLv3pm2h5BQOb6iKCShKoaBwYPBnt
	xWcv6H4AxRHrdswr4oT7TVHdZHrjOtl9IJ+MnaUmCcegRGWq36ac+cKSOJZHJcv/0jJSLijla7xkp
	0naebiXpXITDuR8qomtfFQmEjq9cWD9qqR2XB9BhlTcUz8vfnVVfrJaskviwqREl6/WwV28zNjS7L
	pxNvQI5Q==;
Received: from i53875a11.versanet.de ([83.135.90.17] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vJgMl-0005bo-Er; Fri, 14 Nov 2025 00:04:35 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Johan Jonker <jbx6244@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: rockchip: correct assigned-clock-rates spelling
Date: Fri, 14 Nov 2025 00:04:25 +0100
Message-ID: <176307502904.495066.10732097835351829050.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <92714b6c-6c0d-4a10-afe4-73ed313c87c0@gmail.com>
References: <92714b6c-6c0d-4a10-afe4-73ed313c87c0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_150437_730147_953670D7 
X-CRM114-Status: UNSURE (   9.28  )
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


On Sat, 01 Nov 2025 16:35:26 +0100, Johan Jonker wrote:
> Due to some copy and paste from the manufacturer tree the property
> assigned-clock-rate is missing a letter "s". Correct spelling to
> reduce dtbs_check output.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: correct assigned-clock-rates spelling
      commit: 76f4f7e04c213eff794ef6dcb1f216a57c6f2a16

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

