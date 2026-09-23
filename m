Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538A6C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7f/DhvgKTnawyvSXfr/sexvubDEI+pZfGZpdZHSN5s=; b=ATdzWB6l5f0IiAmF5nx4zL7V+S
	Be+tSPX5qzNjVV/jTsVU7kZFVuVJsRpyIjg352uOZoUECZUX2dzUU3wQNCxgoHuJ/5SFAPZIAGyxz
	Wr/LPS4EsDSJgo9w92xQsyameQJZROq7cUuQ1qQCsvQ8E5FQUtT1e6faLITrEeX0wIqCec8gkTSI/
	V22j0NOZC2AvrZ0hNHNLMz9YQIUyvRB6YraN4HuRMS4wtbExMZwiU2HbhJTDhUky9Vfl+h1HPk0u0
	VrR5NXN7ryoEQcRVtqiYQnBY/2jjtl3W11Y8ZBbcM4eehEg2zP1J+t95o9nCuEBpSckQn0yOQqaRJ
	IEQN0Dww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ITB-00000007Y68-0an3;
	Wed, 23 Sep 2026 08:36:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IT8-00000007Y5I-1zB7;
	Wed, 23 Sep 2026 08:36:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790152604;
	bh=wPJ65swN4gwLVJL1QU9v8xzT2amPCdMTcyY3rDc8NAk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ldb0PsCxHEMyEuuJomgs/vGq7l+WLiYyWNd12ZsdkzWL5HEwGL2+r+pgmnQ85/Ejz
	 //6GU8psH/Hne/1xrg6nxkm+DLQFxMZnpgL4ewlD5ezlIvFL5cSgeFbWxK+rXjndE4
	 xLcyya2NFnaK1njW/OQU5EzDXKhxTKjqVrfiwvg7q0ZNwXU8/VPth13MUaqjXYumpS
	 pX7Pi2esPKOjAIQwHFC/9m66zaDJNuVGALZxUQxGPrHFAeLX30DYjSmRBhvi6/GQEV
	 4FpFbHOvLHp4MqJmLxImqFNnyYcMTF7/dVYdePojiHYrX44CjxlYffFoFNcDpK0Bpv
	 iLGqILHZbNdDA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A0E2717E0104;
	Wed, 23 Sep 2026 10:36:43 +0200 (CEST)
Message-ID: <e43f4637-5468-4d2c-91b3-dbbe377216c3@collabora.com>
Date: Wed, 23 Sep 2026 10:36:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] cpufreq: dt-platdev: block the driver from probing on
 MediaTek mt6572
To: rva333@protonmail.com, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260923-6572-cpufreq-v1-0-41f7af6d6d1a@protonmail.com>
 <20260923-6572-cpufreq-v1-3-41f7af6d6d1a@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260923-6572-cpufreq-v1-3-41f7af6d6d1a@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_013646_956867_B2FF7569 
X-CRM114-Status: UNSURE (   6.75  )
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

On 9/23/26 09:23, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> MediaTek SoCs use mediatek-cpufreq driver instead of generic one. Add
> mt6572 to the blocklist.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


