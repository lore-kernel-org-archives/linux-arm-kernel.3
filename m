Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62C7C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 01:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sh9+1hvv6UwRMngtc5TSXRZC1oxTpQsSSmadqfMNyiA=; b=ffCpNnrvLl+3sfWjQOuKST+uqC
	IFpR9uQvIFIZpUPLrFlrPnCDFV7aFfO+qjQqF9AmGFD6A5kyT1A/MybUUm3EByAi94YQCvgsOd5FZ
	nGkfa4x+dXFdWEVNPL7B6m03wZVe/mrxrndACvSVPlgFyh+mO9FB4OHTxi965Inhy6FxeDw9Piy1Y
	RAw0Viu4+5RbaaMBBVOB7s1ZrbWkIoYpMUbEf35mSDD81eIYbpS+AJLx0WhjglBzsQlg6QJxs1CMC
	yle5IuyhwAMB3UEvHYZdm4bkCxFwZKzt/9zZKIV3ee4aqY0du3PFfGvVV52Vg8zaK0itDVi/jkdEL
	TGChwe/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugveU-00000000SRu-1Edm;
	Wed, 30 Jul 2025 01:30:42 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugvc0-00000000SAX-0sNT;
	Wed, 30 Jul 2025 01:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1753838823;
	bh=sh9+1hvv6UwRMngtc5TSXRZC1oxTpQsSSmadqfMNyiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=L26pIwG47655UfL7hvcGbxBpv3OA4fWQOCkQ4PA8yrDL/3pnzXlQCPouSJs3mKw5z
	 Tlz+FmOm7e9b8ZgJpHSdSs50r6JIhT9hVUIsN+1bEoc1afuILNFpqyqRVLCIjGifd0
	 TWw9/M00Noexxh/K71u1mYkimA6DmmoTBXYLm6Xg=
X-QQ-mid: esmtpsz20t1753838814t9a57cd4b
X-QQ-Originating-IP: TJCihVAB9aallGYP7dENX5Iebrj2pvT0M2uwEcEmSfA=
Received: from [172.16.12.153] ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 30 Jul 2025 09:26:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17714488166574995387
Message-ID: <C0B5444C2EE8051C+3877b039-f814-4f79-a9b0-44096226ce73@airkyi.com>
Date: Wed, 30 Jul 2025 09:26:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] arm64: dts: rockchip: Add missing dp_out port for
 RK3399 CDN-DP
To: Diederik de Haas <didi.debian@cknow.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20250729090032.97-1-kernel@airkyi.com>
 <20250729090032.97-5-kernel@airkyi.com> <DBOSZZ7TMD2P.U0MGKUR3DXN@cknow.org>
From: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <DBOSZZ7TMD2P.U0MGKUR3DXN@cknow.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MjA5tsjrlPcvfX57mZ+y5mvYlm08jiJwh3td6pGsoT8JuVxJNedovtcf
	FMarMhsIIoqbT0B46W+TPOI5UnI6gAoLrWO/+ymmdEH6TRBpF5iEa88kFt/9ihlSAEbfHSB
	vSCT59DpAbDRiMSCOkvpLMT6b2MsfcDCln9sK/4bUSIvseAiIgtXAwiBCIKvt5TLU4Z/OO5
	PeT1flrdF5+GOHnpacErZ47wUV0XoaRcsBxsLn74ldrPZcM7js0LmJpyLaNXWTegHagpec/
	3G1Sv96pmquyaVC+srELO+OegzsSMETCqGnIu/uiofcWWAqeBLdJf27cbacqHCkmPrQaJW6
	gb7pL1hPO4c6FavmzkXsGUvx9c3vvqbey3vPU2o8OadCOjSHvvgzm58buaN+awnOiGNc3Zu
	lVh5XeD1o/t30spIfRrKPeplIyYYELrQFKKiWciaqf6d7OvcOaAqXtchhSx2oITcG5HlIs/
	duHQ/u33KAFAqO0EcBiMsLSoxiPzeILICIEPxZvcfsnMBDEBCQXtMK2tKridh05xsbYxaSz
	ngUz3GCjsfp9Beea7AKJkK3BMtpUzHKJ562WAAyxhxzbXq+HcJ+INSQCNXUvicOrsCFVDLg
	SkEZVXVkuJQcNqtiRew4DzIndzc0Rg2an6VNgg/GLVOOC2YtlLyNa+B1I174cKeVy/Q8HaH
	pCu0XgL547tSOmZvgSpJg0Cc4/UQMaQXiVtqM7BSiWrDxckW8DsNkYtcvmdJDh1HX0VrV3S
	SrknYkMWKWsvyZBodDwMRcESduBoREcjoAiSk06XBw6lR/ThoR1fLiqhMYdOps9agZ/GcUB
	JKXoRY+3f2/CqhSnaQvYpklUw2V+il8pWi8NZUmApxnCIulCjHRcCnPMU2wHwHsCIvdOPYZ
	x+4lCCcmpMbbMvWuum0uGJ3+HHPEwZU0hcBiTZ9UrtOupGDg0hUv5iU1v1U1A2EmNW/skan
	v7cbYuzlTTnWl693BotJFrqy6aWRAe5EyY8g1kvgsMS6d2g==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_182808_610865_2B84EE1D 
X-CRM114-Status: GOOD (  15.86  )
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

On 7/30/2025 3:59 AM, Diederik de Haas wrote:

> On Tue Jul 29, 2025 at 11:00 AM CEST, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> Let's make the ports nodes of cdn_dp in the same style as the other
>> display interface, and match the style of ports's yaml.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
>> index 9d5f5b083e3c..edeb177bc433 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
>> @@ -618,7 +618,11 @@ cdn_dp: dp@fec00000 {
>>   		status = "disabled";
>>   
>>   		ports {
>> -			dp_in: port {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			dp_in: port@0 {
>> +				reg = <0>;
>>   				#address-cells = <1>;
>>   				#size-cells = <0>;
>>   
>> @@ -632,6 +636,12 @@ dp_in_vopl: endpoint@1 {
>>   					remote-endpoint = <&vopl_out_dp>;
>>   				};
>>   			};
>> +
>> +			dp_out: port@1 {
>> +				reg = <1>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +			};
> Patch 5 adds a single endpoint to dp_out (without a reg property), so it
> seems that #address/#size-cells is not needed?
> If you run ``make CHECK_DTBS=y W=1 rockchip/rk3399-evb-ind.dtb`` it
> should spit out a warning about that.
Exactly! Will remove this in v4.
>
> Cheers,
>    Diederik
>
>>   		};
>>   	};
>>   

