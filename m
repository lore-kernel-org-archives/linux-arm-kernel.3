Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BB9F54ABA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEsibGR4Gnt8WxsSGkKjIUukhG44jXijQmtsq+XVE1w=; b=VnqPpFPadtIY7tJbitzONWrSEM
	n6+mFNTe2uV5hquGSGhcAvjVnyCk7ugisVaiKbPf6GzT4FilQWIr8KzO80VaZlGrXVQAwc7ILLDIY
	bpeHyAg4IAYHmhxnYlZbgk4oR9HVSC8KpRsJvSy7R57Gcg0TuEl9TPlh+2cg8FS89kpzITJFIfafi
	6FVI0iEaUFRfkQ8RHKOaTlbCM5vDifxDMzqb9zo/U7n9S1K+GQWEaElolYUKjFRMdaYN96lpz1WmY
	ztXvL582f4C+ax94KR8ItP12r7vZ4lXTi7/3mCbVwAwcFhXgfGku+twSj/z0r4hF2Sreo8fGjKHoq
	oOAWrbyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52BP-00000001a3q-0fb2;
	Tue, 24 Mar 2026 13:52:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52BM-00000001a35-144d;
	Tue, 24 Mar 2026 13:52:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774360345;
	bh=94g3Jg52tfyyaalRLEEVRBjds2/VXmSCbqO88/kuIRM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Br2n+bfWa86iLGjFkIKN3RXN70ujcfb5BBGlJ72iAEPgKZfE7mXdNCAt3y5CCgyjA
	 mZOcyi2mcQPViWimIfZcQXVGr19CjvgsYAOBMYoDZXHZ7FtDIZ7prhuVJ4vvNrbBne
	 Z7dLzKzSbTWeIKV2TJkBHanxNz6/+3dbteGRV7ig8j6iAJ8E4JnTUJ963dleOyCQRY
	 hrwstTi04oV+K4s3/TnPwBc5b/TSYdX2G0wCpWg+Lo4ldPa82DyMjHFdiLBqzHgIqu
	 lHygSjtJb+uTCx1k93vYMoHfeZjMT3X7x0CA6dCaL9C09ApJfZ+inXHJR/Ya8CbLFb
	 XewNfOpBZ++bg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 92CBA17E5A12;
	Tue, 24 Mar 2026 14:52:25 +0100 (CET)
Message-ID: <b8b9ad39-0e9e-4c38-b080-85153b2a66d1@collabora.com>
Date: Tue, 24 Mar 2026 14:52:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 Device Tree updates for v7.1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arm-soc <arm@kernel.org>, soc <soc@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com
References: <20260320085641.15843-1-angelogioacchino.delregno@collabora.com>
 <20260321-aspiring-real-foxhound-4a18e7@quoll>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260321-aspiring-real-foxhound-4a18e7@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_065232_452389_1CECBA8D 
X-CRM114-Status: GOOD (  10.68  )
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

Il 21/03/26 12:07, Krzysztof Kozlowski ha scritto:
> On Fri, Mar 20, 2026 at 09:56:38AM +0100, AngeloGioacchino Del Regno wrote:
>> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
>>
>>    Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>>
>> are available in the Git repository at:
>>
>>    https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v7.1
>>
>> for you to fetch changes up to 820ed0c1a13c5fafb36232538d793f99a0986ef3:
>>
>>    arm64: dts: mediatek: mt7986a: Fix gpio-ranges pin count (2026-03-12 13:32:17 +0100)
> 
> Days in linux-next:
> ----------------------------------------
>   0 | +++ (3)
> 
> With 0 days in next, you cannot really react on any bug reports.
> 

OUCH!!!

Sorry about that, I didn't notice that my for-next didn't get pushed when I tried
to actually push it (and I was 100% convinced that I had checked after pushing).

Krzysztof, thanks for making me notice, that was completely unintentional.

I re-pushed the for-next branch exactly a second ago; that should give it some good
time in -next ... or well, otherwise, we can always delay those commits for v7.2 or
for fixes.

Cheers,
Angelo

