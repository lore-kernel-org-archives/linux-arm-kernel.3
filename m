Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B80E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 16:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=08VrfUyoU/2/C8nbKKfG14sPDdjEt6tqG0Qan2MqWy0=; b=pGR3Fys1AaASPKRuCXPdUDOjJi
	UkqF9N+7SbZekKmAe502ti6M+Az1Hk4EujV9vK7PIzABjIBrn4B70Ivw9pEple0XyPAQbY7mv1uKW
	2/j+VSPblz67LIGIx4XTuhVFI4LVPmEH88o2F0RQJOZB2T9L7P7T6wE6kfrBQl6+sDUBM8uEj69Iy
	NsXj0NECSZaKXKLugl0Nmznb2yQtanSzLEOk+Zpu4lVhUap7LYr6v79knQalUmOWgrFRPG++2WVWq
	p4DVCWj56xihidtSK85RLYGnW5t1YWU7F13fJ3XaRDyIj+ahJkxqaYExARF9yh2vsIeFaZ4ft3KHl
	xIe0dLBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJb7-00000002ObX-1Avd;
	Thu, 19 Dec 2024 16:42:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJa0-00000002ON9-03ne
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 16:40:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7791C1480;
	Thu, 19 Dec 2024 08:41:18 -0800 (PST)
Received: from [10.57.73.186] (unknown [10.57.73.186])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D7C013F58B;
	Thu, 19 Dec 2024 08:40:47 -0800 (PST)
Message-ID: <df010fb9-44f7-44f4-b242-f7f06eb0adcb@arm.com>
Date: Thu, 19 Dec 2024 16:40:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] coresight: Add label sysfs node support
Content-Language: en-GB
To: Mike Leach <mike.leach@linaro.org>
Cc: Mike Leach <Mike.Leach@arm.com>, Mao Jinlong <quic_jinlmao@quicinc.com>,
 James Clark <James.Clark@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
References: <20241217063324.33781-1-quic_jinlmao@quicinc.com>
 <20241217063324.33781-3-quic_jinlmao@quicinc.com>
 <985d234c-e088-469d-b9dc-7904fcf5a91c@arm.com>
 <PAVPR08MB967401DC65384CBA26B6829C8C052@PAVPR08MB9674.eurprd08.prod.outlook.com>
 <53354e84-73c0-403b-bbc0-af619196596d@arm.com>
 <CAJ9a7VhWZkNcYWUfUkU8+OuQK-Cnu6kp6x23M4s5jHLa3_TpJQ@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CAJ9a7VhWZkNcYWUfUkU8+OuQK-Cnu6kp6x23M4s5jHLa3_TpJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_084052_152670_BCCD97CA 
X-CRM114-Status: GOOD (  31.63  )
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

On 19/12/2024 11:17, Mike Leach wrote:
> Hi,
> 
> On Wed, 18 Dec 2024 at 18:16, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>>
>> Hi Mike
>>
>> On 18/12/2024 09:56, Mike Leach wrote:
>>> Hi
>>>
>>>> -----Original Message-----
>>>> From: Suzuki K Poulose <suzuki.poulose@arm.com>
>>>> Sent: Wednesday, December 18, 2024 9:38 AM
>>>> To: Mao Jinlong <quic_jinlmao@quicinc.com>; Mike Leach
>>>> <mike.leach@linaro.org>; James Clark <James.Clark@arm.com>; Rob Herring
>>>> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
>>>> <conor+dt@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Bjorn
>>>> Andersson <andersson@kernel.org>; Konrad Dybcio
>>>> <konradybcio@kernel.org>
>>>> Cc: coresight@lists.linaro.org; linux-arm-kernel@lists.infradead.org;
>>>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
>>>> msm@vger.kernel.org
>>>> Subject: Re: [PATCH v6 2/2] coresight: Add label sysfs node support
>>>>
>>>> On 17/12/2024 06:33, Mao Jinlong wrote:
>>>>> For some coresight components like CTI and TPDM, there could be
>>>>> numerous of them. From the node name, we can only get the type and
>>>>> register address of the component. We can't identify the HW or the
>>>>> system the component belongs to. Add label sysfs node support for
>>>>> showing the intuitive name of the device.
>>>>>
>>>>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>>>>> ---
>>>>>     .../testing/sysfs-bus-coresight-devices-cti   |  6 ++++
>>>>>     .../sysfs-bus-coresight-devices-funnel        |  6 ++++
>>>>>     .../testing/sysfs-bus-coresight-devices-tpdm  |  6 ++++
>>>>>     drivers/hwtracing/coresight/coresight-sysfs.c | 32
>>>> +++++++++++++++++++
>>>>>     4 files changed, 50 insertions(+)
>>>>
>>>> Do you think we need to name the devices using the label ?
>>>>
>>>
>>> No - absolutely not. If we use label to name devices then we have to validate that the string is a correctly formed device name and that it has not been previously used.
>>
>> Anything that doesn't contain '/' can be a device name ? And it is very
>> easy to find if the device name has been used in the coresight bus,
>> after all these devices only appear there.
>>
>> It is as good as :
>>
>> bus_find_device_by_name(coresight_bus_type, NULL, name) == NULL
>>
>> Of course with coresight_mutex() held.
>>
>> Suzuki
>>
> 
> DTS label property (DT spec 4.1.2) is a freeform string, specified to
> be a human readable description of the device, e.g. :-
> 
> cti0@0x1000 {
> reg = <0x1000>;
> label = "main system CTI";
> };
> 
> Arguably the label is completely unnecessary - as the @0x1000 tells
> the knowledgeable user, with a hardware specification of the device
> precisely what this CTI does and is related to.
> 
> The point of this patchset is to add context to the name@addr to make
> the identification of the devices easier.
> 
> The DT compiler should ensure that the device tree is well formed.
> Using driver selected names (cti_cpu0 ... etc) guarantees  that every
> device found in the DT has a unique representation in sysfs.
> 
> Once a freeform string is used, then not only are duplicates possible,
> illegal device names are possible, all of which can result in missing
> nodes or worse. This requires handling / complications that are
> unnecessary for the purpose.
> 
> Yes of course it is easy to look for duplicate names, reject bad ones,
> emit errors - but that could end up with a partially working system
> with missing components.
> 
> Why add potential for breakage when it is not necessary?

Fair enough, we can do away with exporting the label.

Cheers
Suzuki


> 
> Regards
> 
> Mike
> 
>>
>>>
>>> Using the canonical driver selected names works best as we are guaranteed a unique name and the information label can be used to provide flexible context information that best matches the users requirements.
>>>
>>> Mike
>>>
>>>> Or is this enough ?
>>>
>>>> Suzuki
>>>>
>>>>
>>>>>
>>>>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
>>>>> b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
>>>>> index bf2869c413e7..909670e0451a 100644
>>>>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
>>>>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
>>>>> @@ -239,3 +239,9 @@ Date:           March 2020
>>>>>     KernelVersion    5.7
>>>>>     Contact: Mike Leach or Mathieu Poirier
>>>>>     Description:     (Write) Clear all channel / trigger programming.
>>>>> +
>>>>> +What:           /sys/bus/coresight/devices/<cti-name>/label
>>>>> +Date:           Dec 2024
>>>>> +KernelVersion   6.14
>>>>> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
>>>>> +Description:    (Read) Show hardware context information of device.
>>>>> diff --git
>>>>> a/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
>>>>> b/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
>>>>> index d75acda5e1b3..944aad879aeb 100644
>>>>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
>>>>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
>>>>> @@ -10,3 +10,9 @@ Date:             November 2014
>>>>>     KernelVersion:   3.19
>>>>>     Contact: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>>>     Description:     (RW) Defines input port priority order.
>>>>> +
>>>>> +What:           /sys/bus/coresight/devices/<memory_map>.funnel/label
>>>>> +Date:           Dec 2024
>>>>> +KernelVersion   6.14
>>>>> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
>>>>> +Description:    (Read) Show hardware context information of device.
>>>>> diff --git
>>>>> a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
>>>>> b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
>>>>> index bf710ea6e0ef..309802246398 100644
>>>>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
>>>>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
>>>>> @@ -257,3 +257,9 @@ Contact:        Jinlong Mao (QUIC)
>>>> <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_t
>>>>>     Description:
>>>>>              (RW) Set/Get the MSR(mux select register) for the CMB
>>>> subunit
>>>>>              TPDM.
>>>>> +
>>>>> +What:           /sys/bus/coresight/devices/<tpdm-name>/label
>>>>> +Date:           Dec 2024
>>>>> +KernelVersion   6.14
>>>>> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
>>>>> +Description:    (Read) Show hardware context information of device.
>>>>> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c
>>>>> b/drivers/hwtracing/coresight/coresight-sysfs.c
>>>>> index a01c9e54e2ed..4af40cd7d75a 100644
>>>>> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
>>>>> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
>>>>> @@ -7,6 +7,7 @@
>>>>>     #include <linux/device.h>
>>>>>     #include <linux/idr.h>
>>>>>     #include <linux/kernel.h>
>>>>> +#include <linux/property.h>
>>>>>
>>>>>     #include "coresight-priv.h"
>>>>>     #include "coresight-trace-id.h"
>>>>> @@ -366,18 +367,47 @@ static ssize_t enable_source_store(struct device
>>>> *dev,
>>>>>     }
>>>>>     static DEVICE_ATTR_RW(enable_source);
>>>>>
>>>>> +static ssize_t label_show(struct device *dev,
>>>>> +           struct device_attribute *attr, char *buf) {
>>>>> +
>>>>> +   const char *str;
>>>>> +   int ret = 0;
>>>>> +
>>>>> +   ret = fwnode_property_read_string(dev_fwnode(dev), "label", &str);
>>>>> +   if (ret == 0)
>>>>> +           return scnprintf(buf, PAGE_SIZE, "%s\n", str);
>>>>> +   else
>>>>> +           return ret;
>>>>> +}
>>>>> +static DEVICE_ATTR_RO(label);
>>>>> +
>>>>>     static struct attribute *coresight_sink_attrs[] = {
>>>>>      &dev_attr_enable_sink.attr,
>>>>> +   &dev_attr_label.attr,
>>>>>      NULL,
>>>>>     };
>>>>>     ATTRIBUTE_GROUPS(coresight_sink);
>>>>>
>>>>>     static struct attribute *coresight_source_attrs[] = {
>>>>>      &dev_attr_enable_source.attr,
>>>>> +   &dev_attr_label.attr,
>>>>>      NULL,
>>>>>     };
>>>>>     ATTRIBUTE_GROUPS(coresight_source);
>>>>>
>>>>> +static struct attribute *coresight_link_attrs[] = {
>>>>> +   &dev_attr_label.attr,
>>>>> +   NULL,
>>>>> +};
>>>>> +ATTRIBUTE_GROUPS(coresight_link);
>>>>> +
>>>>> +static struct attribute *coresight_helper_attrs[] = {
>>>>> +   &dev_attr_label.attr,
>>>>> +   NULL,
>>>>> +};
>>>>> +ATTRIBUTE_GROUPS(coresight_helper);
>>>>> +
>>>>>     const struct device_type coresight_dev_type[] = {
>>>>>      [CORESIGHT_DEV_TYPE_SINK] = {
>>>>>              .name = "sink",
>>>>> @@ -385,6 +415,7 @@ const struct device_type coresight_dev_type[] = {
>>>>>      },
>>>>>      [CORESIGHT_DEV_TYPE_LINK] = {
>>>>>              .name = "link",
>>>>> +           .groups = coresight_link_groups,
>>>>>      },
>>>>>      [CORESIGHT_DEV_TYPE_LINKSINK] = {
>>>>>              .name = "linksink",
>>>>> @@ -396,6 +427,7 @@ const struct device_type coresight_dev_type[] = {
>>>>>      },
>>>>>      [CORESIGHT_DEV_TYPE_HELPER] = {
>>>>>              .name = "helper",
>>>>> +           .groups = coresight_helper_groups,
>>>>>      }
>>>>>     };
>>>>>     /* Ensure the enum matches the names and groups */
>>>>
>>>> _______________________________________________
>>>> CoreSight mailing list -- coresight@lists.linaro.org To unsubscribe send an
>>>> email to coresight-leave@lists.linaro.org
>>
> 
> 


