Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AE0C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 12:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQBc5LP0vmFx/V66Vjbe083Znh5xE+JQ+TY92nzyv3A=; b=rboJIcn99shOgHVr/T2dN5xj7v
	AlYBA8Ci/RNhATsl2PdiFSXx0SUWJ451JKOcJ9IERA69/yz6HdxvE3UWFQI7Ji7NcpRR9MzQviL6l
	vqNXKiqX4kPTpBjrNgyXij47RZ/js+Zl/ktQmFeehvnKLNWWI8n2j6CAXy1pzwGTm06L5pMIXswJ8
	uJL1d5tzU+3SskKyI8WyT3wrDI59TX5zxpWA6SrHmaYxYklMMuxJbtDtqS+ozA42O/DAmHVrRZZ66
	OVWHoKGi5jJRhZ8zp1yVdiv9RP4lnsKrOArVhp9j1ZMQNbWs3I7w2YqnmnP0rwD/1Y/7ypzC9f+wS
	ZTX0n4bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmnj-00000006fL8-2Q3L;
	Mon, 20 Jul 2026 12:08:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmnf-00000006fKT-3xdE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 12:08:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 256D62B;
	Mon, 20 Jul 2026 05:08:40 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA9A33F99C;
	Mon, 20 Jul 2026 05:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784549324; bh=XuN1ZHDosv8zSjFIBBK37p0R1UvJY5wqIYvpZy1jn24=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cm9qtiieufgIrsldPhEK9QZHMdTr/fgejcGBub1Axz+JF6VoIbtAcvRvhN5Y3CFTW
	 Afw2wtsK9LNMFVRokWOxMcB4lnZYvy204m0qwXbVZYKljR28n3jbTVa9czP4OeBwzA
	 A6BywJWlhmM98Nwt3sQG6EJlzF+C/xyazPfwt9uM=
Message-ID: <d7f4fae1-faa9-4504-8c2e-cbc58d8a42fe@arm.com>
Date: Mon, 20 Jul 2026 14:08:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] Arm Live Firmware Activation (LFA) support
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 Varun Wadekar <vwadekar@nvidia.com>,
 Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org,
 Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20260706134455.132091-1-andre.przywara@arm.com>
 <alUMGCJzVG6U3Ggm@kunlun.suse.cz> <alYjFwi0dnld-wP3@kunlun.suse.cz>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <alYjFwi0dnld-wP3@kunlun.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_050848_116149_3381B274 
X-CRM114-Status: GOOD (  23.80  )
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

Hi Michal,

thanks for having a look and for testing!

On 7/14/26 13:52, Michal Suchánek wrote:
> On Mon, Jul 13, 2026 at 06:02:35PM +0200, Michal Suchánek wrote:
>> On Mon, Jul 06, 2026 at 03:44:40PM +0200, Andre Przywara wrote:
>>> Hi all,
>>>
>>> this is version 3 of the Live Firmware Activation kernel support. The
>>> device part of the code now relies on Aneesh's SMCCC bus patches[1],
>>> which solves some problems rather nicely. I also added the formerly
>>> missing sysfs ABI documentation. Based on v7.2-rc1, plus the first
>>> two patches from Aneesh's series. More detailed changelog below.
>>> ==============================
>>>
>>> This series implements the kernel side support of the Arm Live
>>> Firmware Activation (LFA) specification [2]. LFA enables the activation
>>> of updated firmware components without requiring a system reboot,
>>> reducing downtime and allowing quicker deployment of critical bug fixes
>>> in environments such as data centers and hyperscale systems.
>>> It requires explicit firmware support, both via an agent running in EL3
>>> (for instance in TF-A, already merged), but also in the firmware
>>> component to be activated. TF-RMM recently merged support for this.
>>>
>>> Unlike the usual firmware update process (which may use tools like
>>> fwupd), LFA focuses solely on the activation of an already updated
>>> firmware component, called "pending activation" in LFA lingo. This works
>>> by signalling the LFA agent (part of the EL3 runtime firmware) via an
>>> SMC call, which then does the heavy lifting of the live update, in
>>> cooperation with the to-be-updated firmware component.
>>>
>>> Key features of the driver:
>>> * Detects LFA support in system firmware (EL3).
>>> * Lists all firmware components that support live activation, identified
>>>    by their GUID.
>>> * Exposes component attributes (e.g., activation capability, and
>>>    activation pending) via sysfs under /sys/firmware/lfa/<GUID>/.
>>> * Provides interfaces to:
>>>    - Trigger activation of an updated firmware component.
>>>    - Cancel an ongoing activation if required.
>>> A more detailed list of features can be found in patch 2/8.
>>> Based on v7.2-rc1.
>>>
>>> This work is conceptually similar to Intel’s Platform Firmware Runtime
>>> Update and telemetry (PFRUT) [3] and TDX module updates [4], but
>>> targets Arm platforms. The driver has been used to successfully activate
>>> a Realm Management Monitor (RMM) firmware image in a controlled test
>>> environment. RMM is analogous to Intel’s TDX module.
>>>
>>> There is effort on similar work from the OCP [5]. Future work may
>>> include integration with utilities like fwupd to automatically select
>>> the appropriate driver, based on platform architecture, for Live/Runtime
>>> firmware updates.
>>>
>>> Please have a look, test and comment!
>>
>> Hello,
>>
>> booting a kernel with v2 of this patchset applied the module does not
>> get autoloaded. Loading it manually I get
>>
>> [ 1972.957282] [   T5195] Arm LFA: Live Firmware Activation: detected v1.0
>> [ 1972.958620] [   T5195] Arm LFA: registered LFA ACPI notification
>>
>> Is this expected?
>>
>> I would expect the driver to load automatically.
>>
>> I do not see anything in the v3 changelog obviously addressing
>> autoloading but changing to using a bus might affect that.
>>
>> I will try to update to v3 later.
> 
> Hello,
> 
> updating to v3 of the patchset resolves the problem.

Yes, that was indeed a change that came for free with changing the 
probing method to be now SMCCC bus based. As Krzysztof rightfully 
mentioned before, the driver was always probing, then bailing out if the 
service was not available, which is not the way it should work under the 
driver model. As a side effect, there wasn't really any discovery or 
auto-loading mechanism. With the new SMCCC bus this should now all be 
solved.

Thanks for testing!
Cheers,
Andre

> The driver is now autoloaded.
> 
> Thanks
> 
> Michal


