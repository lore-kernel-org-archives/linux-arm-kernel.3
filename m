Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0ABD6408D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 08:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wYrbfZXZh7/scKLy3xbaCZxrm00VHqIIzOcEqNZUpE=; b=NEA3kS0apP58l8XCYRx66oUvm7
	+FWfjXkCoUE7XKXmf3sDaN5XayH/qtEfz2Ae4S1KxVoj6p/1DtTTAmMs45GFNwzuI088Ung7WNW/1
	XZFxIRD3qy174haGJEerRVSflg7iup46CwnLd4MM4urDPH6ozviHgNpJcDYpAEDWfuPlN3H7wmO2d
	xxyPKAz1XHLEH9z8KT38Am6Q08vYOKDnxDJslVRWscEBIfTMhCj5LEl5As4/COZgEVupGlWIsUBls
	PQ9G4YdEfsJdzLBDoz90xL8gaVTvhfLgT6QODedjcwnjpk52tzG9P8Iuq7zsJ5BL4fTnUSK91SQCL
	rU2O+ZUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmwT-00000006M3C-3aTh;
	Wed, 17 Dec 2025 08:31:29 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmwQ-00000006M0d-1XGQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 08:31:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765960275;
	bh=1wYrbfZXZh7/scKLy3xbaCZxrm00VHqIIzOcEqNZUpE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=X2Kg35igSxKpsjL8aK8/Htu0f0qjfdhWw8i6M6+waNxAEC2djTGcmXwTZvwbPB72N
	 Tr9HGIuY9zdCTpouj4IMDAiYBToAFU6N48x9o77txNHsdsb7gtFUPOEglcL2FjLDDF
	 U4afLnP6sr1oNFg4g5Y+xqg7SnXNSpbOLcyd76DSSSZBIx2NQV5CebAH3rgg6tz0D4
	 93uuyUDsGowxvqPVaAveI5knAey1SaG/ni6LQa//yuhbn8aSqT0zoG/c+gm6Z9ekI7
	 4lVSgVtpLxHaBkDhyzPd3+6KwmhUZAg+JepV6tEFt1kduAaVIigUm6icz1w+sv/acz
	 ReR/yJ0lHlj/Q==
Received: from [127.0.1.1] (unknown [180.150.112.216])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6C1337DEAD;
	Wed, 17 Dec 2025 16:31:15 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, Cosmo Chou <chou.cosmo@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 cosmo.chou@quantatw.com
In-Reply-To: <20251217023938.445721-1-chou.cosmo@gmail.com>
References: <20251217023938.445721-1-chou.cosmo@gmail.com>
Subject: Re: [PATCH v2 0/5] ARM: dts: aspeed: bletchley: Fix dt-schema
 warnings
Message-Id: <176596027534.2875246.12913980516498879452.b4-ty@codeconstruct.com.au>
Date: Wed, 17 Dec 2025 19:01:15 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_003126_607514_119F56D1 
X-CRM114-Status: UNSURE (   6.71  )
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

On Wed, 17 Dec 2025 10:39:33 +0800, Cosmo Chou wrote:
> This series fixes dt-schema validation warnings by using generic node
> names, correcting GPIO property suffixes, and removing unsupported
> properties. No functional changes.
> 
> Changes in v2:
> - Split single patch into 5 separate patches by change type
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


