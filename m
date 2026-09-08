Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9E6C79FAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 07:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KDDWuuig/neAh5td292MC5JW0NcTn3Fa9wdfUuI64Ig=; b=3LQiUvmXfxsdLmHqvGCN1QbORM
	FSYzM7XhUTy/WE+0uFgm6WZG6CgukNttp4D5FnUKPs7U3ePsWJDd1Oe44ibzYek8AKb0uajhrer0L
	31oh+hsWjsUP8H1Jb/ZULQCkTfH1GfX2jvwhbQ4JwrkqPke3WdoMIMFUcZUuAMFobCAut941ubi50
	iRCpEQTSfRmq0KOJvJOA5IGdmrW9ZtzU6sTgf1XHrkYPydVnI4AXxcILGgdSCH75U83eocba4UAF3
	4rJhiselgdr7S7n70S/iSWqyfhLALl+HBk0NTY2DQOB7ZMuWrQ2BLE3d8JVtKzovMq3u3w0t8bjD5
	jAVv8I+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3q2w-00000008Fq3-14wj;
	Tue, 08 Sep 2026 07:15:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3q2v-00000008Fpk-2d48;
	Tue, 08 Sep 2026 07:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KDDWuuig/neAh5td292MC5JW0NcTn3Fa9wdfUuI64Ig=; b=AFUQtXfeRleqL+8nrN7EG9ydhS
	kDW6DcjKyVP16bDtlR7dO4UFWHYukH8MPek0w4c6mup3sFlry1CHYrmzV8re6m97TVMhYDCqw5hxp
	8MExT8xYipKPXdaBOUL8kejEl4egu85KDqY+0atc/VRQREKICRbTOIpzRjeaGfu5SOcPViWQWOCeS
	qhP4GoPB2wABb1sQ0aY3SmlUgtZqCP7XxY8+3IeulEcSumKlxYkq5gytMFdVlPvtnCw0Iy2DfpHrG
	wZZDUsLtzuaebhLQxUgtQWYJfuqVwkquzUJTngVCD8/i9RuMx+HV0qcTPooVicrIBZCnkIlRoQbnf
	Tb405YIg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3q2s-0000000H2Mq-1N4A;
	Tue, 08 Sep 2026 07:15:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788851695;
	bh=ArJeW2flTkb9rm1gkhAoy7DoxwAb/3A+bJJPz0B1eno=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LuGOZcyyYxieMA3pMCJAyaJj4o8p1ih3RqpJ1LuoGQp+cy3nnBLkjNQS1Io4bo2wR
	 7628PQg3TYOICpTlTHfBOaYB1w8fXqkGR5OaZrC5DzS8+QmRSFAGrZ4AaDazBnz/MH
	 yDfEtCZQXdrz7V/e0cizk0yfoL74Lzjxm18VJ5nHQHyv4nWuXOHTTOLYgJQZte062R
	 TcaPBywqYnWCcqhCmBTW+72QziGLgPLBUGvFHAuUDVGp9WMlTMcBQakjgxUoxpO/Cc
	 LhaB0TPUUMpAzxPVPOLMXYnkHH0RIbtOefVzc3cwxjswOHnUvmhBz+lyhE1iEtR0uI
	 9P0fTU1CLhe8w==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5070217E027D;
	Tue, 08 Sep 2026 09:14:55 +0200 (CEST)
Message-ID: <30806e9c-8d37-4f99-b9d6-a2819acaeb50@collabora.com>
Date: Tue, 8 Sep 2026 09:14:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pwm: mtk-disp: Fix period readback
To: Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pwm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jitao Shi <jitao.shi@mediatek.com>
References: <20260827105738.8570-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260827105738.8570-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_081506_544174_01BAF4B5 
X-CRM114-Status: UNSURE (   9.55  )
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

On 8/27/26 12:57, Chen-Yu Tsai wrote:
> The period value stored in the register is the number of clock cycles - 1.
> 
> Account for the offset when calculating the period in nanoseconds. This
> fixes the discrepancy reported by the pwm core when CONFIG_PWM_DEBUG=1:
> 
>      mediatek-disp-pwm 1100e000.pwm: .apply is not idempotent
>      	(ena=1 pol=0 281500/499875) -> (ena=1 pol=0 281500/499750)
> 
> Calculation discrepancy in the driver was found by AI run by a colleague
> while debugging another PWM related issue. Check against SoC datasheet
> and fix done by the author.
> 
> Fixes: 3f2b16734914 ("pwm: mtk-disp: Implement atomic API .get_state()")
> Cc: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


