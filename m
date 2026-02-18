Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AFAE9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 16:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BB8J3JMtEPj5H0CRRPlNePbZc8U65x2uvJAooEjNMl8=; b=qHUh3f4DQiRTjkY/eFQ0KXZffQ
	2kRtBPraVWlvxVkbsnW3xLCl5pu1TeBzlYNjf3n1Fm9UtF+1QquWH1J8oibO1yzs/Jii/aMMr2qMC
	/8pb1vJbK9BGK3PpmJhCd/mkOh/svC0t8XDVxegTlZhxKDS5xY1ZEWkLm6nFcj9N25sSNyO1ERdtc
	ST005+jXXM8tfTZ8X1xT87m07rUEmvnfjAvpsyf+ZKow/0rfdVM3o51YwL2HQxrsT3E0FcXVmYwLl
	uUfCavSxz+uQ7v3jmv3/AZGgIv6dWwDGdTANcWumL6yWF6W460qM1NSH3xIUz/egiXCr4nPXGqfsN
	1CB5Ijpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vskXz-0000000A5fr-3y56;
	Wed, 18 Feb 2026 16:37:07 +0000
Received: from 6.mo619.mail-out.ovh.net ([46.105.41.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vskXv-0000000A5eL-1xqg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 16:37:06 +0000
Received: from ex.mail.ovh.net (unknown [10.108.54.138])
	by mo619.mail-out.ovh.net (Postfix) with SMTP id 4fGMbs3P0Mz9xLs;
	Wed, 18 Feb 2026 16:36:57 +0000 (UTC)
Message-ID: <0af0667d-c140-4f6d-86cc-6be0460bf81a@aliel.fr>
Date: Wed, 18 Feb 2026 17:36:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 6/7] arm64: dts: amlogic: Add clock and EMMC for T7
To: Krzysztof Kozlowski <krzk@kernel.org>, Ronald Claveau
	<linux-kernel-dev@aliel.fr>, <linux-amlogic@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260218102045.35633-1-linux-kernel-dev@aliel.fr>
 <6d86917f-5326-4ce2-91e3-c57534e5e8a2@kernel.org>
Content-Language: en-US
From: Ronald Claveau <ronald.claveau@aliel.fr>
In-Reply-To: <6d86917f-5326-4ce2-91e3-c57534e5e8a2@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [92.184.116.81]
X-ClientProxiedBy: CAS11.indiv.local (172.16.1.11) To DAG11EX2.indiv.local
 (172.16.2.112)
DKIM-Signature: v=1; a=rsa-sha256; d=aliel.fr; s=ovhex24454-selector1;
 c=relaxed/relaxed; t=1771432617; h=from:to:subject:date;
 bh=BB8J3JMtEPj5H0CRRPlNePbZc8U65x2uvJAooEjNMl8=;
 b=OrCxkhqmoZcDSL60qrYCnV9E5BfShFmPAzDQ+upkCRt6kTyrqAkN+C6ShoMTTHOAv+1ItcC5vasHn9virT/BWgwlikhkpzPFLhyZmZkWq23c4kCVK58RK5IRLA+4lXcUZEmDQHnkhI8SDr5lnYDykEJFBvvWmxq4nnUM11i5mSMXIcsBaBnRqSARFQc6Fa67MpHYOaBzhsxwZePCP6HZuZf7v2C+w/AXtDyd/wS8n6T6Tixit3cj7kJEu4iwugZl56c6NtAW4x/drvncPSU8qeX29Yg6oS1X5X9LlN8T4fcSopPIjylXAPG/tpJar8MnVjUP8trWr26pIk1C+EbYVQ==
x-ovh-tracer-id: 16909327752792051004
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEvs4p4vQ7GXQ5O2JhWd9mTFTO0zoeJJDbrIokzMsxjA81NEwHUl2L95GjJ6SQ/tY45Ymi2tltV9rjNU4nFqVmUS3Yugb85209eNJjlP8FHv0teMyES8ilkogrcEY2cPzKrNC2De0B3Ccs07MCf+rkVElaryVzaXsMzcqOFq/9agWD63VqdWe9dvZGKsUjpqoxYFek7hNIZ4iCgdRkC687G2vFPP67qg6xEDdBZUIuhFlN7ERLL2iBH5w2YNQyReHIlZZ9sSBYaAQeTBSMx0uFXzYB2+RZ06S+cHERcxh6Z2TNSdAqlETtp5jnH3wOeuFAdQuv1dqzN8pm+Sm+zUsDmO8Jylx5nqK4ijLYVgBmWs8pcjAItMf3aXLysxNUKNO0+2hFGypLyPRYkTrOy2JpGuPyVf7TkYpN4/irGh0ISdtuUVUPx0S+6VsBnebSXGRKoi9uDDJyZL0JUkMvz2x3GAfEOh4WKUJ32ehXry4b51j04hB/vi47I3ux85rXP8+is+HLFPgeE6RoBmTaI/EbgAF/wuGpqM/YZX5pCKS95jCCASBNiRtKgyvJlo8BIWlscvJa+vydt5hD96KFVPKi4KAJpD4TGBSB5hHUScwqPxIBFQqbcgDhFVfHbRh+DzSySfX42n9fqzFXt02+nbrehn8BMKHuOb8FiPAG07swEmQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_083704_523535_BAAD2F38 
X-CRM114-Status: GOOD (  16.56  )
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

On 2/18/26 11:23 AM, Krzysztof Kozlowski wrote:
> On 18/02/2026 11:20, Ronald Claveau wrote:
>> Add fixed clock and EMMC support for Amlogic T7 SoC family dtsi.
>>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> ---
>>  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 137 +++++++++++++++++++-
>>  1 file changed, 134 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> index 6510068bcff9..e5932eb3db2b 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> @@ -3,6 +3,8 @@
>>   * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
>>   */
>>  
>> +#include <dt-bindings/clock/amlogic,t7-peripherals-clkc.h>
>> +#include <dt-bindings/clock/amlogic,t7-pll-clkc.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>  #include <dt-bindings/power/amlogic,t7-pwrc.h>
>>  #include "amlogic-t7-reset.h"
>> @@ -208,12 +210,14 @@ soc {
>>  		ranges;
>>  
>>  		gic: interrupt-controller@fff01000 {
>> -			compatible = "arm,gic-400";
>> +			compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
> 
> I don't get how this is related to "Add fixed clock".
> 
>>  			#interrupt-cells = <3>;
>>  			#address-cells = <0>;
>>  			interrupt-controller;
>>  			reg = <0x0 0xfff01000 0 0x1000>,
>> -			      <0x0 0xfff02000 0 0x0100>;
>> +				  <0x0 0xfff02000 0 0x2000>,
>> +				  <0x0 0xfff04000 0 0x2000>,
>> +				  <0x0 0xfff06000 0 0x2000>;
> 
> Neither this really.
> 
> ...
> 

You right, I will send a different patch to address that specific issue,
and I will remove it here for v2.

>> +
>> +			sd_emmc_c: mmc@8c000{
>> +				compatible = "amlogic,meson-axg-mmc";
> 
> Compatible says axg, DTS says T7, so something does not feel right.
> 

The SOC family is T7, but the emmc is fully compatible with this same
axg code.
I did the same as used in meson-g12-common.dtsi or meson-s4.dtsi, which
use the same compatible.

Best Regards,
Ronald

