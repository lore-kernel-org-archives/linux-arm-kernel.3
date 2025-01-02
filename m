Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FCAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 18:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJGwyvNDo4LuU9ph2O+haRIo+mnjlXHpnUp7EbfBYaw=; b=1LyjUIzWXjsfVZx/kqvaXUN04K
	gJdzzaCc7R6MFknpSBJD1XNdA3MEFk/ZAh9uHOZix03/DcmrJcF5PBDS4bLxTogPNb6/31M6S4dVT
	QDJw+iJF/cQbN4yPRi7lQtJFO+4aartJiulEgfkX7ZJWxjL+WwRN/fuqNUrvuq/d38/0TChu/d0dF
	ImnR564bW27B3MS+GqC67bCXkmMY7R8CcDOeZp4JkOYZjaYuMk4pll7j8zfBJGGaW12lyXfPvSO9I
	aSgL7AQ2Xk9HDxf6QyJErlQ28tzKJNU5Jp5tQY5RTFo2ecLpZS9TEOdPA2ZQNESCNCrFCvGbivDAK
	J4DETJbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQPf-0000000BDMH-0PGG;
	Thu, 02 Jan 2025 18:59:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQOV-0000000BDDW-0Vy9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 18:58:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 03B7C5C59C8;
	Thu,  2 Jan 2025 18:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B68B1C4CED0;
	Thu,  2 Jan 2025 18:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735844285;
	bh=ifr+rM2wbqLz1g6wpl7uHrjJhiMHA2Tg5ejsBvR2lkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OvA5S9/2o4/RLnIQusHHRpuW1nkjDUTMAgZvElfXkh72p88VS6QbODz75WxXd+p9z
	 fMiqbTg/hMZp+8ZvEToU7lI4/IPfayP8SgAMiX6qDraEVvZhZuxT24gHrAD4TzypDw
	 2FqcJLeDL7bXYBNlkVePMdbFbpiNIxfrt3wfXrDoUChBUJks56NTcf/OtK9EezzGqT
	 U4PrjrHgkJ+MuxDmNdJ1Gxjo0m8qULMKl9zUZHjR8qkXzk+RgzuiZN92CvRlUYKApj
	 wSHUJas7Rq3TrG3vKWQSkQ+3PC+IIq6wXoNBLZwULki4HwKkwSnhtny8e0dpxpiiD1
	 zA/cD0VOThXXg==
Date: Thu, 2 Jan 2025 19:57:59 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: robh@kernel.org, linux@fw-web.de, dlemoal@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch,
	gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
	linux@armlinux.org.uk, hdegoede@redhat.com, axboe@kernel.dk,
	linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: Aw: Aw: Re: [PATCH v1 1/3] arm64: dts: marvell: Fix anyOf
 conditional failed
Message-ID: <Z3bht59DzN8yXjvX@ryzen>
References: <20241109094623.37518-1-linux@fw-web.de>
 <20241109094623.37518-2-linux@fw-web.de>
 <20241111203611.GB1887580-robh@kernel.org>
 <trinity-796b046d-1857-413e-bb82-78e700d6b5ac-1733138371404@msvc-mesg-gmx005>
 <trinity-a84b41b3-79c5-49b5-9786-eb89f85578cc-1735843472332@trinity-msg-rest-gmx-gmx-live-548599f845-gxsb9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-a84b41b3-79c5-49b5-9786-eb89f85578cc-1735843472332@trinity-msg-rest-gmx-gmx-live-548599f845-gxsb9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_105807_202699_C7EF8CC4 
X-CRM114-Status: GOOD (  10.36  )
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

On Thu, Jan 02, 2025 at 06:44:32PM +0000, Frank Wunderlich wrote:
> is there any new state here? got no answer for my last 2 Messages
> 
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20241109094623.37518-2-linux@fw-web.de/
> 
> sorry for the html-entities...they came from my gmx webmailer, it is reported multiple times, but i cannot do more here :(
> 

Since this is a marvell change, I expect it to go via marvell / mvebu tree.


Kind regards,
Niklas

