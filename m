Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEF7C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 09:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNCxm5ySA6gUecwOHe3y8mEje2Y2/q1LkLwa+vPENf8=; b=tSU/iVZ5w+5nndg6wrSd0+aGc9
	C1I0k5vbLYEXBBiy1Rl+8q7kmhDknsd6dgBXPy1bmFGl/HlN00Rh2z7hz+La0Kpa5lLWvWrTtkyxW
	/VTN/XXke4K0haLG+gA3ViPIK7Xx3kQDqP9U29ZUlX0AO4RRfDxNfdT1pqDjcoFxx1h9HPVZx8ZXG
	ODvKk7j2HShYRaipoRUTvW+b9mY0bRHRn1QWo9Y/GA1uRy5lOxmNDDMTPDt+zqqWeZcvq8G9wIlmN
	KGcz+miHCHz0fqDiO8msZpojbqAaw46m7ebQmzoebq3Yth//cAahgLTt7wYw50vLPeScr/U6of1wf
	mlpxyCTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWAwg-00000001lmW-2mlR;
	Mon, 30 Jun 2025 09:37:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWAsa-00000001l3G-0eQ4;
	Mon, 30 Jun 2025 09:32:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751275966;
	bh=QWD/CZiB02p5Y9rO/SrSW4JBcHFnpOwu/VqcsLoMJnI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oKHMoiWElN1piNx6lnOGBBN3mlX0nfB2KP6BBJZTI1844D6x9kqssN/NSARTunD/O
	 Ssvf7n3hq2l1a/tXIkqNMBYw2mouhknv+SULB3ZWJAIDdT2XQ1Bbc6osdiJ11jhWmg
	 LXAcogkiNNgFrY579znmNLB4/eadkA8SAb6Tw7Ymy5+A+2NP9Ut3gaF/pHqX1aJT2S
	 5le/dPJ9sVRkcqg2TQ/vj7mUik7b+MrPeKbirQkcFpgkXxzm1d0Ud0ABULYtLzQddv
	 UsX+Y5OI0dq9iV14BmXHfQEqAfRjiTT1WD0D+GXUMqdNPRp3iWqXn4AhXjiPuToH/Y
	 fDVbEv3hrOwIw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9985B17E0B0D;
	Mon, 30 Jun 2025 11:32:45 +0200 (CEST)
Message-ID: <e958afe7-b338-47dc-905e-f3223b4f3cdb@collabora.com>
Date: Mon, 30 Jun 2025 11:32:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/13] pmdomain: mediatek: Refactor bus protection
 regmaps retrieval
To: Fei Shao <fshao@chromium.org>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, ulf.hansson@linaro.org,
 y.oudjana@protonmail.com, wenst@chromium.org, lihongbo22@huawei.com,
 mandyjh.liu@mediatek.com, mbrugger@suse.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, kernel@collabora.com
References: <20250623120154.109429-1-angelogioacchino.delregno@collabora.com>
 <20250623120154.109429-3-angelogioacchino.delregno@collabora.com>
 <CAC=S1njT6ygGuZDPU5KDW94Nu-TbM21DM-6HdR7Pio=WTD_eQA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAC=S1njT6ygGuZDPU5KDW94Nu-TbM21DM-6HdR7Pio=WTD_eQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_023248_344319_783CFCBE 
X-CRM114-Status: GOOD (  30.86  )
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

Il 27/06/25 14:12, Fei Shao ha scritto:
> On Mon, Jun 23, 2025 at 8:02 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> In preparation to add support for new generation SoCs like MT8196,
>> MT6991 and other variants, which require to set bus protection on
>> different busses than the ones found on legacy chips, and to also
>> simplify and reduce memory footprint of this driver, refactor the
>> mechanism to retrieve and use the bus protection regmaps.
>>
>> This is done by removing the three pointers to struct regmap from
>> struct scpsys_domain (allocated for each power domain) and moving
>> them to the main struct scpsys (allocated per driver instance) as
>> an array of pointers to regmap named **bus_prot.
>>
>> That deprecates the old devicetree properties to grab phandles to
>> the three predefined busses (infracfg, infracfg-nao and smi) and
>> replaces it with a new property "mediatek,bus-protection" that is
>> meant to be an array of phandles holding the same busses where
>> required (for now - for legacy SoCs).
>>
>> The new bus protection phandles are indexed by the bus_prot_index
>> member of struct scpsys, used to map "bus type" (ex.: infra, smi,
>> etc) to the specific *bus_prot[x] element.
>>
>> While the old per-power-domain regmap pointers were removed, the
>> support for old devicetree was retained by still checking if the
>> new property (in DT) and new-style declaration (in SoC specific
>> platform data) are both present at probe time.
>>
>> If those are not present, a lookup for the old properties will be
>> done in all of the children of the power controller, and pointers
>> to regmaps will be retrieved with the old properties, but then
>> will be internally remapped to follow the new style regmap anyway
>> as to let this driver benefit of the memory footprint reduction.
>>
>> Finally, it was necessary to change macros in mtk-pm-domains.h and
>> in mt8365-pm-domains.h to make use of the new style bus protection
>> declaration, as the actual HW block is now recognized not by flags
>> but by its own scpsys_bus_prot_block enumeration.
>>
>> The BUS_PROT_(STA)_COMPONENT_{INFRA,INFRA_NAO,SMI} flags were also
>> removed since they are now unused, and because that enumeration was
>> initially meant to vary the logic of bus protection and not the bus
>> where work is performed, anyway!
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
> 
> <snip>
> 
>>
>> +static int scpsys_get_bus_protection_legacy(struct device *dev, struct scpsys *scpsys)
>> +{
>> +       const u8 bp_blocks[3] = {
>> +               BUS_PROT_BLOCK_INFRA, BUS_PROT_BLOCK_SMI, BUS_PROT_BLOCK_INFRA_NAO
>> +       };
>> +       struct device_node *np = dev->of_node;
>> +       struct device_node *node, *smi_np;
>> +       int num_regmaps = 0, i, j;
>> +       struct regmap *regmap[3];
>> +
>> +       /*
>> +        * Legacy code retrieves a maximum of three bus protection handles:
>> +        * some may be optional, or may not be, so the array of bp blocks
>> +        * that is normally passed in as platform data must be dynamically
>> +        * built in this case.
>> +        *
>> +        * Here, try to retrieve all of the regmaps that the legacy code
>> +        * supported and then count the number of the ones that are present,
>> +        * this makes it then possible to allocate the array of bus_prot
>> +        * regmaps and convert all to the new style handling.
>> +        */
>> +       node = of_find_node_with_property(np, "mediatek,infracfg");
>> +       if (node) {
>> +               regmap[0] = syscon_regmap_lookup_by_phandle(node, "mediatek,infracfg");
>> +               of_node_put(node);
>> +               num_regmaps++;
>> +               if (IS_ERR(regmap[0]))
>> +                       return dev_err_probe(dev, PTR_ERR(regmap[0]),
>> +                                            "%pOF: failed to get infracfg regmap\n",
>> +                                            node);
>> +       } else {
>> +               regmap[0] = NULL;
>> +       }
>> +
>> +       node = of_find_node_with_property(np, "mediatek,smi");
>> +       if (node) {
>> +               smi_np = of_parse_phandle(node, "mediatek,smi", 0);
>> +               of_node_put(node);
>> +               if (!smi_np)
>> +                       return -ENODEV;
>> +
>> +               regmap[1] = device_node_to_regmap(smi_np);
>> +               num_regmaps++;
>> +               of_node_put(smi_np);
>> +               if (IS_ERR(regmap[1]))
>> +                       return dev_err_probe(dev, PTR_ERR(regmap[1]),
>> +                                            "%pOF: failed to get SMI regmap\n",
>> +                                            node);
>> +       } else {
>> +               regmap[1] = NULL;
>> +       }
>> +
>> +       node = of_find_node_with_property(np, "mediatek,infracfg-nao");
>> +       if (node) {
>> +               regmap[2] = syscon_regmap_lookup_by_phandle(node, "mediatek,infracfg-nao");
>> +               num_regmaps++;
>> +               of_node_put(node);
>> +               if (IS_ERR(regmap[2]))
>> +                       return dev_err_probe(dev, PTR_ERR(regmap[2]),
>> +                                            "%pOF: failed to get infracfg regmap\n",
>> +                                            node);
>> +       } else {
>> +               regmap[2] = NULL;
>> +       }
>> +
>> +       scpsys->bus_prot = devm_kmalloc_array(dev, num_regmaps,
>> +                                             sizeof(*scpsys->bus_prot), GFP_KERNEL);
>> +       if (!scpsys->bus_prot)
>> +               return -ENOMEM;
>> +
>> +       for (i = 0, j = 0; i < num_regmaps; i++) {
> 
> Did you mean BUS_PROT_BLOCK_COUNT?
> Consider a case where only regmap[2] is configured.
> 

Yep. None of the many platforms that we have tested hit this issue, but it's as
bad as it sounds! :')

Thanks for spotting this one!

Cheers,
Angelo

> Regards,
> Fei
> 
>> +               enum scpsys_bus_prot_block bp_type;
>> +
>> +               if (!regmap[i])
>> +                       continue;
>> +
>> +               bp_type = bp_blocks[i];
>> +               scpsys->bus_prot_index[bp_type] = j;
>> +               scpsys->bus_prot[j] = regmap[i];
>> +
>> +               j++;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
> 
> <snip>

