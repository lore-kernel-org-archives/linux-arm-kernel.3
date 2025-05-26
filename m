Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4792AC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 08:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZERPBESWHCzHAZIRg67GVfwNEEmyh+2Nz/8LZQRFxvk=; b=mbFirdtZcSkhmOCt56XYBjlAnL
	g55GjAOEp5swJUqhtxjLignBhQk0gmQLiXFS6e+JtSvo8OWld1Ow/rMMdquLYeYvDvAIDuy561Lu2
	TSvaUTqikbdh0E052D5cWJIkLGCRVCULnTt4Fg1BjqNWAN4tSY3nVDypJOhHmntxVPNjdwmtMdJ9K
	bKvQpHXFvUl6FZOAsCPGrUN0nDNaMJ8RFcMCo9nT5eKUWgg26h9dc0jiyr14JNYqvdmwHI2G05/Mg
	bpyrgSD6KtJuv0vyrzP5f0hLRq27Kd51gltWw1aSkAUSUU+PF9x12j+VXgd9p349y9a0rN9MlWRid
	l9uyLzhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJTcq-00000008RRS-3jKN;
	Mon, 26 May 2025 08:56:04 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJTah-00000008RDV-1Nbi;
	Mon, 26 May 2025 08:53:52 +0000
X-UUID: ef5a1a7a3a0e11f0b29709d653e92f7d-20250526
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:2a582296-71b1-4427-aff1-0d66ba2e24a6,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,BULK:30,RULE:Release_Ham,ACTI
	ON:release,TS:37
X-CID-INFO: VERSION:1.1.45,REQID:2a582296-71b1-4427-aff1-0d66ba2e24a6,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,BULK:30,RULE:Release_Ham,ACTION
	:release,TS:37
X-CID-META: VersionHash:6493067,CLOUDID:01155e3f26d2f9f964f0833965c5c673,BulkI
	D:250522180435BN613KC0,BulkQuantity:7,Recheck:0,SF:19|24|38|45|64|66|72|78
	|80|81|82|83|102|841,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:0,File:nil,RT:ni
	l,Bulk:40|23,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:
	0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT
X-CID-BAS: 1,FCT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: ef5a1a7a3a0e11f0b29709d653e92f7d-20250526
X-User: aichao@kylinos.cn
Received: from [172.25.120.86] [(112.64.161.44)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 2088584585; Mon, 26 May 2025 16:53:46 +0800
Message-ID: <3869e6fc-1cbf-4113-9b34-0cbb5d4b5176@kylinos.cn>
Date: Mon, 26 May 2025 16:53:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
To: Christophe Leroy <christophe.leroy@csgroup.eu>, perex@perex.cz,
 tiwai@suse.com, johannes@sipsolutions.net, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, broonie@kernel.org, jbrunet@baylibre.com,
 neil.armstrong@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, srinivas.kandagatla@linaro.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 imx@lists.linux.dev, kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
References: <20250522050300.519244-1-aichao@kylinos.cn>
 <20250522050300.519244-3-aichao@kylinos.cn>
 <8ad901c3-3fcb-4643-ac5a-c1f30f93d07f@csgroup.eu>
Content-Language: en-US
From: Ai Chao <aichao@kylinos.cn>
In-Reply-To: <8ad901c3-3fcb-4643-ac5a-c1f30f93d07f@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_015351_666959_5015E277 
X-CRM114-Status: GOOD (  12.41  )
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

Hi Christophe:

>> The for_each_child_of_node_scoped() helper provides a scope-based
>> clean-up functionality to put the device_node automatically, and
>> as such, there is no need to call of_node_put() directly.
>
> I don't understand this explanation.
>
> You say "no need to call of_node_put()" and the only thing you do in 
> addition to changing from for_each_child_of_node() to 
> for_each_child_of_node_scoped() is to _add_ a new call to of_node_put().
>
> I would expect to see a _removal_ of some of_node_put() when I read 
> your description.
>
>>       }
>> +    of_node_put(sound);
>> +

The for_each_child_of_node() function is used to iterate over all child 
nodes of a device tree node.  During each iteration, it retrieves a 
pointer to the child node via of_get_next_child() and automatically 
increments the node's reference count (of_node_get()). Each call to 
of_get_next_child() increases the reference count (refcount) of the 
returned child node, ensuring that the node is not freed while in use.
for_each_child_of_node() increments the child node's reference count in 
each iteration but does not decrement it automatically.
If of_node_put() is not called manually, the reference count will never 
reach zero, resulting in a memory leak of the node.

In function i2sbus_add_dev, it used device_node out of 
for_each_child_of_node(){},  it need to add a new call to 
of_node_put(sound) to reference count.

In function i2cbus_probe, it used device_node in 
for_each_child_of_node(){}, used for_each_child_of_node_scoped() is 
better than for_each_child_of_node().

Best regards,
Ai Chao

