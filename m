Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F46C624D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 19:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tOvw3f7t6HcjWhjfHmJIkfqXA9IbvIuOoAwA1C8v/LI=; b=UcAChRVawwzHI0nXFIBZjtXgkk
	RipBt+m08lTvhuALy/sfR/xFCyUkr9IM7B3c2y1RBmzf9Qz9DgHvMQeSlfXfM0+gXRElMN3b721Hb
	88xvkPSs8z0yydV2sLVhh8eQ/16VP9OkQUvt675c7ybMFU+omGxSBehrWvlx67nJggXa5fPnOdJN2
	dcYmEb9fIFoggsFqalIxwFiET+FBUtHGeYpgs0sDrR9fKvHQrLNczRXeSCAkxa1ILJQu+YsZBCCQm
	S+Sd/F0HZ6UOC6hv8dB2uWwoSWCCrJipFUonW41GpfwJ1HxNqoSZ+hNKbyyzasTB4KFMWkP+g8Ar8
	ecaCg9Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2DVq-00000000W5a-0JHC;
	Thu, 03 Sep 2026 19:54:18 +0000
Received: from lpdvsmtp10.broadcom.com ([192.19.144.205] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2DVn-00000000W5D-2JeH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 19:54:17 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id BA814C0003D4;
	Thu,  3 Sep 2026 12:54:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com BA814C0003D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1788465253;
	bh=5ywL+AjbqduBPI70f+35daeMhjjmOPDHuxP9jp+8fRk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wNlMycB36Ai1OrwMD/ANDaWaMr/1zObPuven9GeU64hX3flJv9gwyNaXk9vsNwBnl
	 HmSLMzglOg9pEpPEQe015TJBII9DYDykLWyQ896m7MH6epHC0HqQ+Xg7mPa4ij7S+j
	 +sSjLn5dW4EpkwAIVdk/DmzeSgoyiOEheviHtaqo=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 5DA06A9A;
	Thu,  3 Sep 2026 12:54:13 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Rosen Penev <rosenp@gmail.com>,
	devicetree@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:BROADCOM BCM53573 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: BCM53573: Rename mpcore node to mpcore-bus
Date: Thu,  3 Sep 2026 12:54:12 -0700
Message-ID: <20260903195412.2040463-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806003703.5141-1-rosenp@gmail.com>
References: <20260806003703.5141-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_125415_656010_DDC6D142 
X-CRM114-Status: GOOD (  10.78  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Wed,  5 Aug 2026 17:37:03 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> The 'mpcore' node name does not match the simple-bus node name pattern
> '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'.
> Rename to 'mpcore-bus' to match the pattern, consistent with the
> naming used in bcm-nsp.dtsi and bcm-ns.dtsi.
> 
> Assisted-by: OpenCode:Big-Pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

