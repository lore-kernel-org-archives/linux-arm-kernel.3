Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1146DD2D101
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 13:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ruF/DsgLWD0LRXxihhCM3ESkEbVG3zR2tbPJGjW51E=; b=mEinI4zzJB9xh/65Le8N91RB6G
	BCb5iPbBpSHbNf1pWtc1pWD9sFeq1m+3+lnXnsz1S3ZgSkl78Ry+9ce4xGJ/7T25io6tdAIgTt8sf
	ZYD+L8e4LR6oAofkI3ft+5+Yq9oDhKP6i7e/dn6Loo4ILHXOA8d6JahW/uTypfPsMX1ONFm2DGvmP
	3l9IqqelfiBDM66nmYOUQz3Hz+rQMb8zfrURe47HAxwJjmzSRLwZ6JNj3qBmo00WAVz/8ATbZa8lB
	LycOnSgL4ekO69GfWajCoGJiCdvPr4LFHKfuKMexZgMeYR9/pRbvoLAiZpAYBpdHBGf2fKpZE8Y6R
	uNUN0U5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfejM-00000007Au8-2xL8;
	Tue, 13 Jan 2026 13:46:44 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfejJ-00000007ArT-0ama
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 13:46:44 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dr9Wl230xz9tbf;
	Tue, 13 Jan 2026 14:46:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768311987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ruF/DsgLWD0LRXxihhCM3ESkEbVG3zR2tbPJGjW51E=;
	b=mZ6EEVYiZBBXdssndtpObyqnE1uihRU40kAdZos5gzlOWVPeu5Lq4cNGqaZgKTJ6p99jxz
	7DyKSFZxk5a3Jq/KRvd8AVUW0KtjzwRQHkIJpto/M+PWwKWXYwXP1xgiQu1obNaxunmqF0
	e1J4M0N+0znpD2GSehQI4mFwXtneGvZjD004PeWZ1k5eqWOO1dlGTk0PDc4nYKqRDR+DBp
	6QSKDeT+nDTR+Z4h7ugsUvH2iy1P1AZKRN/pE3k8KnqSqfcinYJ0XhuTpFNkYu8JOmAwtJ
	vnNKTNQHvYIk2qx02zy3RhtTSkpj9rjnS9EZfbLf6mKCS7mAlwnj/f7lwY8Axw==
Message-ID: <16413d54-ee02-4939-af51-d7f9ab0404f7@mailbox.org>
Date: Tue, 13 Jan 2026 14:46:21 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Fork Waveshare panels
 into separate document
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVGsfCTzSSjh474Ohimad2W5h1Z=vNhS6zU=Lb9f5Zbxw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVGsfCTzSSjh474Ohimad2W5h1Z=vNhS6zU=Lb9f5Zbxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 588823f942cb957b9f4
X-MBO-RS-META: nhcdrwhot3odx4wmekmq13qmg4s4teu5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_054641_329150_8F307D7C 
X-CRM114-Status: UNSURE (   8.04  )
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

On 1/13/26 10:13 AM, Geert Uytterhoeven wrote:

Hello Geert,

>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/waveshare,dpi.yaml
>> @@ -0,0 +1,32 @@
>> +# SPDX-License-Identifier: GPL-2.0
> 
> scripts/checkpatch.pl:
> 
>      WARNING: DT binding documents should be licensed (GPL-2.0-only OR
> BSD-2-Clause)
>      #68: FILE: Documentation/devicetree/bindings/display/panel/waveshare,dpi.yaml:1:
Sigh, fixed in V2, thanks .

I'll send V2 in a few days to get some feedback on 2/2 first.

