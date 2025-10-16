Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996C7CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 05:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zH2ugzxP683voaQgSLdGyqCOGA8yxqXZYuzfOzbl74E=; b=GE2AwxSkzpKDvA4+FHPuxtA5m2
	HyN+RQxRw2tleVLcmter8EjkxQv9/+0vsoAQnA0L7BN8h7ic6mMUhgfMXuj9YD2oMemc+nWXcIigH
	OV6iuouf6sqrLU3ts7OxblpSd2RGZHDVxunuvAOZfWVvEBcZsb+GwGtTSE0q1mz40LibCFRVWEEca
	apW+v5QEU0F1zeWJqlLUeBz9L0IZb0g0GL5ujhZKRX9BH4pJ2U73D8ihwf3HPGlDl3s9cOv0YUAVx
	PfTuDvltr13CgIkQQfDAygYDWPHilbQbbYnoAiWWRUqshk7JRC8oyzCkPZEjfK6kJGZiwJuHyVv2D
	Zh8fl2Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9H1e-00000003YZY-2AsZ;
	Thu, 16 Oct 2025 05:59:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9H1c-00000003YZB-0uOR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 05:59:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D88648E39;
	Thu, 16 Oct 2025 05:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C78EC4CEF1;
	Thu, 16 Oct 2025 05:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760594383;
	bh=8ciTShZccMAg56b4cQsrmTPZobu4kdKJ+1tp/6jLHrc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iSUBroB6zN12uj57egK6nYeGXF+APzMzirw5wPgJ4EFDLmuWHTl7djqwdTvR7e9yW
	 iIomQGcJ7npB5UUXK3wDA4QNY1GwrROFN1kkjByJa0JbmxhMcdoJV41DB9YB6gq6z2
	 suzIP61mHuV7s927w8JSu3qTiK6TFLYhR+94L01R9WUcPht7GIZz9LyVaJH4A6kXZB
	 Fi5oJZBcgl/SeXu4tfIa0huFsCHUtN7RcVz3UdNCnplrd6OlaYi9075op5RCbqOdnU
	 kCev68BHUckZSPlUY65yz/1EfPKcEYu6G1biNv3lav79dbcW818Ee3rrmnAwFekmV+
	 F6x1fWYerGqAA==
Message-ID: <8966ddaf-9c10-4626-a4cc-36efd3fc93e2@kernel.org>
Date: Thu, 16 Oct 2025 07:59:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300: Add support for camss
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, bryan.odonoghue@linaro.org
References: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
 <20251015130130.2790829-3-quic_vikramsa@quicinc.com>
 <b4207e22-8d9c-4223-8b28-272d2650661f@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <b4207e22-8d9c-4223-8b28-272d2650661f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_225944_297183_4C2998BE 
X-CRM114-Status: GOOD (  12.57  )
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

On 15/10/2025 20:49, Vladimir Zapolskiy wrote:
> On 10/15/25 16:01, Vikram Sharma wrote:
>> Add changes to support the camera subsystem on the QCS8300.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 171 ++++++++++++++++++++++++++
>>   1 file changed, 171 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> index 8d78ccac411e..acd475555115 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> @@ -4769,6 +4769,177 @@ videocc: clock-controller@abf0000 {
>>   			#power-domain-cells = <1>;
>>   		};
>>   
>> +		camss: isp@ac78000 {
>> +			compatible = "qcom,qcs8300-camss";
>> +
>> +			reg = <0x0 0xac78000 0x0 0x1000>,
>> +			      <0x0 0xac7a000 0x0 0xf00>,
>> +			      <0x0 0xac7c000 0x0 0xf00>,
>> +			      <0x0 0xac84000 0x0 0xf00>,
>> +			      <0x0 0xac88000 0x0 0xf00>,
>> +			      <0x0 0xac8c000 0x0 0xf00>,
>> +			      <0x0 0xac90000 0x0 0xf00>,
>> +			      <0x0 0xac94000 0x0 0xf00>,
>> +			      <0x0 0xac9c000 0x0 0x2000>,
>> +			      <0x0 0xac9e000 0x0 0x2000>,
>> +			      <0x0 0xaca0000 0x0 0x2000>,
>> +			      <0x0 0xacac000 0x0 0x400>,
>> +			      <0x0 0xacad000 0x0 0x400>,
>> +			      <0x0 0xacae000 0x0 0x400>,
>> +			      <0x0 0xac4d000 0x0 0xf000>,
>> +			      <0x0 0xac60000 0x0 0xf000>,
>> +			      <0x0 0xac85000 0x0 0xd00>,
>> +			      <0x0 0xac89000 0x0 0xd00>,
>> +			      <0x0 0xac8d000 0x0 0xd00>,
>> +			      <0x0 0xac91000 0x0 0xd00>,
>> +			      <0x0 0xac95000 0x0 0xd00>;
>> +			reg-names = "csid_wrapper",
>> +				    "csid0",
> 
> The list of 'reg-names' is not alphanumerically sorted, this is a newly
> introduced sorting order pattern of CAMSS 'reg' property values.


Please stop inventing ad-hoc or fake rules. There is no such sorting
pattern for this property, which I expressed multiple times. Last time
you claimed there is some sorting by "values", now this.

Best regards,
Krzysztof

