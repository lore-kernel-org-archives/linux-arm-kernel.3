Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2FBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 10:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQFIOc3yRanepCEvFpIpqBT/U9U5ljQMIL3lIpiqbHk=; b=g+bCuReZOVZG/xCIt4if8zNJTZ
	q5KOWpE/2DuvEkGn7Zpdxq4rlbF/6ClULge2qCi/4vwje24uRK656tbcK1C6WQTVKMUMShOOBInzr
	LvDV3opFx7RdyeP+HFzbE2oRncgSpVgXr40xJsKovfp7tyiPfJblhXNntDmCM80y0eoCOJrcoasno
	slhN/QSFjDDfeoRhWfdgxsEDH9ApQaP1ZiAOr3f7Ol3jwZ86nmdeAKbg0+K2hVXB8nsf83sE4NYD3
	rnGkVpxDAOIbTtmeOVp9WGcIW/8iYYSD/9Wwri5+JmiczyHYjfprhG0hrP7OAtsv8s/ciEaJoYhDc
	h4EvD5Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeJn-000000087sW-0HVv;
	Tue, 14 Jan 2025 10:38:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeFQ-00000008709-2qyj;
	Tue, 14 Jan 2025 10:34:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736850851;
	bh=qUqYy7fkSdDaUvFWkfpRjthLn6gX435QSqPDwCVPKug=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PAr4UV16xhWm3cx/nG/FQDVlQ4ovWkkHh6Kd2VsAII4+r+8etUMy8Tp+rxKQ5LmqV
	 TlpEU95v1gR055hTXaBxImEV4w5WQ1AKdkxr5z9njhGQPnag2mh+0PLA9mAI5m61Cx
	 jtIeNrZgQqbtVxtxJWWUDnNwqtK49LJmnypm7ZzUnxNGQtYr5QcszUSuKk9ZAilJUn
	 rUg0AfdryyxdAsm5S8YE+OL7sBGKXyDmV8/YVHqhnd+tvTbgC6C6p4KJq9KQcr+8kN
	 QXP7pq+84BE+GymbdDweObFhRLZ6BAeuyQ7au9vtF/BD4g4H5C8RyTEt7q5cSaIDr8
	 yEru4t8zk52Qw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 31FA917E0DB7;
	Tue, 14 Jan 2025 11:34:10 +0100 (CET)
Message-ID: <eef2ead1-e9d7-4f9c-8aca-fa84da3e2210@collabora.com>
Date: Tue, 14 Jan 2025 11:34:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for
 MT8196
To: =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?UTF-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 =?UTF-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "treapking@chromium.org"
 <treapking@chromium.org>, =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
 <20250110123835.2719824-5-paul-pl.chen@mediatek.com>
 <173651725269.2671643.2891127782637834272.robh@kernel.org>
 <SG2PR03MB66367B4A9DBCC971F55DB326BC182@SG2PR03MB6636.apcprd03.prod.outlook.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <SG2PR03MB66367B4A9DBCC971F55DB326BC182@SG2PR03MB6636.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_023412_862481_4F1464CD 
X-CRM114-Status: GOOD (  21.76  )
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

Il 14/01/25 06:49, Paul-pl Chen (陳柏霖) ha scritto:
> Hi Rob
> Thanks for the advice.
> The root cause of the erroneous log message is due to missing power/clock dependencies.
> Once the MTK clock/power header file is upstreamed,

The mt8196-clk/power.h filenames are anyway wrong for upstream.... :-)

Cheers,
Angelo

> we will include a reference link in the next version of the upstream series submission.
>   
> Best, Paul-pl Chen
> 
> -----Original Message-----
> From: Rob Herring (Arm) <robh@kernel.org>
> Sent: Friday, January 10, 2025 9:54 PM
> To: Paul-pl Chen (陳柏霖) <Paul-pl.Chen@mediatek.com>
> Cc: conor+dt@kernel.org; Singo Chang (張興國) <Singo.Chang@mediatek.com>; Sunny Shen (沈姍姍) <Sunny.Shen@mediatek.com>; chunkuang.hu@kernel.org; Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>; fshao@chromium.org; Sirius Wang (王皓昱) <Sirius.Wang@mediatek.com>; dri-devel@lists.freedesktop.org; matthias.bgg@gmail.com; linux-kernel@vger.kernel.org; devicetree@vger.kernel.org; Xiandong Wang (王先冬) <Xiandong.Wang@mediatek.com>; treapking@chromium.org; Nancy Lin (林欣螢) <Nancy.Lin@mediatek.com>; linux-mediatek@lists.infradead.org; p.zabel@pengutronix.de; Jason-JH Lin (林睿祥) <Jason-JH.Lin@mediatek.com>; AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>; linux-arm-kernel@lists.infradead.org; krzk+dt@kernel.org
> Subject: Re: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for MT8196
> 
> 
> External email : Please do not click links or open attachments until you have verified the sender or the content.
> 
> 
> On Fri, 10 Jan 2025 20:33:59 +0800, paul-pl.chen wrote:
>> From: "Paul-pl.Chen" <paul-pl.chen@mediatek.com>
>>
>> Add mediatek,exdma.yaml to support EXDMA for MT8196.
>>
>> Signed-off-by: Paul-pl.Chen <paul-pl.chen@mediatek.com>
>> ---
>> The header used in examples:
>> #include <dt-bindings/clock/mt8196-clk.h> #include
>> <dt-bindings/power/mt8196-power.h>
>> are not upstreamed yet.
>> It will be sent by related owner soon.
>> ---
>>   .../display/mediatek/mediatek,exdma.yaml      | 77 +++++++++++++++++++
>>   1 file changed, 77 insertions(+)
>>   create mode 100644
>> Documentation/devicetree/bindings/display/mediatek/mediatek,exdma.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/display/mediatek/mediatek,exdma.example.dts:18:18: fatal error: dt-bindings/clock/mt8196-clk.h: No such file or directory
>     18 |         #include <dt-bindings/clock/mt8196-clk.h>
>        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/display/mediatek/mediatek,exdma.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
> make: *** [Makefile:251: __sub-make] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250110123835.2719824-5-paul-pl.chen@mediatek.com
> 
> The base for the series is generally the latest rc1. A different dependency should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note that DT_SCHEMA_FILES can be set to your schema file to speed up checking your schema. However, it must be unset to test all examples with your schema.
> 




