Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DDEC021A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 22:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EiUZWzQCMS5pWAnVUksUZCQH8mtcpOOBDIuqxWtAVy4=; b=JXvMc1gNOmNZ42THUqdkZP6mD6
	U1AJqpDea7Q0ao7nC00s8bIBgCwTkPLv460OYQm3L1drS3GqsTGZt5oN+ODazBGn3QYjffJz3Kr0k
	gHQ11BaUun7K3NmPH/cCKD1r7CRmVYOZBK+db+RH+7XHlXmad1gANDMrBefQhZgPVFg529hr1sals
	ln/M8sFAUkHUbFFs5rp2U7wFNFBNOlq3xoOQ1gHgiE7NzJg1W1x/iOm56ZC/cVHIuZRvRSvZBL8xJ
	VO0BsqxvHUlrgD+o4+QpY+wiw1bGXnq4LIq6gMWoMZJQOuYps/QRaggBa8yzAKxOzvPqIdhTHbvaU
	qVUxULlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj4SZ-0000000GQtZ-0N57;
	Fri, 14 Feb 2025 22:46:59 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj4R7-0000000GQcq-2KV6;
	Fri, 14 Feb 2025 22:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EiUZWzQCMS5pWAnVUksUZCQH8mtcpOOBDIuqxWtAVy4=; b=z0yihNX5H/PiP34II2rBN1l5Fb
	imItSSpqqg7SQsP0Rn0wEYMsniGGRARDXao/1Vxg6O3u837AbJxKFSJqNn2SAkzEOJURBzimts6VL
	0nvynPs+LZBM9+XzDxIOXN+JvkckXgY1PeIscObhwFGWGXWxXdBU7Ph/wCZrI/pN3xb5qP1ytK1nB
	Ko3Vqc/uFEtsCq0oH5NxZvw33MQxwOPZM5NUnmlrsRlyfDZQk/25XjGtmHAKO51g/zfthV0MGBMi/
	fBW71GPQ3Y8vydgUm3ruGFcS23LIjKhtI6N2qAWDC5ARkdCrdbVgwt9G4i3zOv9DBtAgWEoWbW85w
	fIRR1XnQ==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tj4R6-0003TH-4h; Fri, 14 Feb 2025 23:45:28 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jonas@kwiboo.se
Subject: Re: [PATCH v2 0/2] Rockchip - add Firefly ROC-RK3576-PC board
Date: Fri, 14 Feb 2025 23:45:16 +0100
Message-ID: <173957310724.1747676.2795519057451074241.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210205126.1173631-1-heiko@sntech.de>
References: <20250210205126.1173631-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_144529_592034_6E1FEE0C 
X-CRM114-Status: GOOD (  12.43  )
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


On Mon, 10 Feb 2025 21:51:24 +0100, Heiko Stuebner wrote:
> This adds a second board based around the rk3576 SoC.
> 
> changes in v2:
> - add Rob's Ack on the binding
> - move ethernet-phy-reset control into the phy-node (Jonas)
> - some sorting cleanups
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add Firefly ROC-RK3576-PC binding
      commit: 2be4a4171401761cb5fb02225d8b18351f6807c0
[2/2] arm64: dts: rockchip: Add devicetree for the ROC-RK3576-PC
      commit: 887ff17cdd8f088a52e2b61e71f2b6c9b9678de6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

