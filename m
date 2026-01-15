Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60208D4661B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 19:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E4fJp9wbmRI1vmPAbrx5E9O/lqTVncJXTTCym1eiIps=; b=uJXpahmFYhln1Q+YzNAgXiilb9
	gZ9dtlz+mY0o4ylbflkl6nXyv2oZEz8NdsgNxgK/zbcORjF1PJV3C4V029jagLHgefqncPLUyCzIT
	cMSh14wWnyKFkJ76SpuQCmRXzSR9qnvDV8q7fWSNFBhj6toIEDkSJf7KOR7f9bMfc1R+Lt94u24TP
	6Y8+Z7wKZq5mxzAc2eC2J0s4r1YXbtq7RXnRlJC7tCVNr069aT/2bOz9GNQwWOcKXNXGnSOuEVsY9
	XvWz7puXQxSTpl6QyaJvQi4ELgbrrin1zXW3fEjInlsMxLSullzr2fKjVrxhiBXXtXPhaypLwOnrc
	BlGrepuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgStQ-0000000D3hm-0q2J;
	Thu, 15 Jan 2026 19:20:28 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgStN-0000000D3eK-41Dk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 19:20:27 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dsXr15RVQz9tDR;
	Thu, 15 Jan 2026 20:20:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768504817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E4fJp9wbmRI1vmPAbrx5E9O/lqTVncJXTTCym1eiIps=;
	b=ggALHCEdtM7NcWEy/LIWICqAGbbnkDV3aCDwdbB+blQ58j9V1ZoauYI2fBb4Q21SxMKTfn
	eipkD+RBlBujcFWGe8yusmki5H31ndlFJUMRHwnUKstNuuv4Wza/A6nSL4Ux8Srtn9DXiC
	ptHSqFvKtMmkmJSu7DaNjK5HJCuUrqPQOg/Zf8hX4jVTZBpZ1LtOANWXRtcToRpP0nIJBM
	59iz2fcIVXZpP5IcHStCiH/nkvKJPzOisZlFdN865VphWsiOQY5Yjr43PTiL5poH110cXb
	NvmJUdImwHXq4/IJqhe86h+olYyyxQ0y+zF3RrM1KswR9vWNmFR7Vp22FelXOA==
Message-ID: <85ff0eb2-d942-4f85-8f1d-c5982bd31bec@mailbox.org>
Date: Thu, 15 Jan 2026 20:20:03 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Fork Waveshare panels
 into separate document
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
 <20260115174047.GA930768-robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260115174047.GA930768-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 744ec2472507d528058
X-MBO-RS-META: qcfhjoyang9zs5kdamujjdinfhhwheqm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_112026_145926_0F411B3D 
X-CRM114-Status: GOOD (  13.50  )
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

On 1/15/26 6:40 PM, Rob Herring wrote:
> On Tue, Jan 13, 2026 at 01:05:30AM +0100, Marek Vasut wrote:
>> Move the Waveshare panels description into separate document, so they
>> can be properly described with compatible = "waveshare,...", "panel-dpi"
>> and attached to "waveshare,dsi2dpi" bridge.
> 
> But why do we need "panel-dpi"? Adding that requires changing a DT.
> Can't you make the kernel handle these compatible strings as a
> "panel-dpi" without the compatible?
I can, but wouldn't we then miss the more specific compatible strings in 
the DT ?

compatible = "waveshare,13.3inch-panel", "panel-dpi";
              ^^^^^^^^^^^^^^^^^^^^^^^^^^
              this ... would be removed. Do we want that ?

The other option would be to add the timings into panel-simple driver, 
then we wouldn't have to change the bindings at all. Maybe that would be 
preferable ?

