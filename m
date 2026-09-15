Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C30C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 17:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O4vL4g4D4xkYUtuTnZrWxwAn75paIp9ZlEmZKpxq+4s=; b=iNKiiRCgBFc9FYlSuublDdYxFz
	RsT9JGDzJPtbX35UGZNsYk0S3aWO4R2YVS66woWyxcK9qEazbhdbFF+pF0HnT58x6fiLJZb/CvHNv
	82Qz2XWpm0HESlLZvMNH3JiUr9UabuZwinm9UoSwn1DsAtdcBkMIurXobBX07zB+bZcAYF6+dzhTW
	/KrURHXy7ikB8U+uIyMSs5IRwEu938fqbVNf5bM1/X5Iyb0UO+slLiGez21RKozKSTZJU75aUyi1K
	hzqRZKmyBFVgBVfccOMvPTvFZvyqjEJRHlF96qdZHR0t95wl4dxvZEQdcKsNkGJLOsrckmHfJ36Ib
	zTHmKkgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XCR-00000007ciH-0kfQ;
	Tue, 15 Sep 2026 17:44:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XCP-00000007chu-2WfQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 17:44:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B2DF40146;
	Tue, 15 Sep 2026 17:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67B11F000FF;
	Tue, 15 Sep 2026 17:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789494244;
	bh=O4vL4g4D4xkYUtuTnZrWxwAn75paIp9ZlEmZKpxq+4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NsX7glzdGfpZEE+6WWH90AJUd7B1Z9i+nb36BbLufx78K77aPi++0e7cLEv02pMRO
	 79v9J8dn9czWZeKsecddjXmXt1uTKwwqSu2aLNTTjET4zPV8zo0YA+fIytxUA0FCJC
	 nV5q/dvI0LO03PqGBIWIndsGuI/RRIgbxqEbmN/YLKf/ST60fDO1rpY1NKEeI1g3Dc
	 tqSfBiGz6wfdyiQYrT1qqxFj3x6d5Klx/ro3w2UZSjL11InDroA+PZIyLCONejUG0y
	 bTu8AVRddf0bVjDrXKgfuySuEbhnhV2A/2b4qQw9HDfiyVpaQbe5H87vmkGZepuzed
	 61Dj0wh5+jv+Q==
Date: Tue, 15 Sep 2026 18:44:01 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com, sashiko-bot@kernel.org
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Breno Leitao <leitao@debian.org>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH v5 7/9] firmware: arm_scmi: Add ACPI PCC transport
Message-ID: <20260915-tidy-glaring-wasp-5b8d0f@sudeepholla>
References: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
 <20260915-acpi_scmi_pcc-v5-7-298579e9f359@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-acpi_scmi_pcc-v5-7-298579e9f359@kernel.org>
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

>On Tue, Sep 15, 2026 at 06:03:41PM +0100, Sudeep Holla wrote:
>> Add an SCMI transport for ACPI-described systems using PCCT PCC
>> subspaces through the Linux PCC mailbox layer.
>> 
>> Parse the SCMI Device Properties _DSD packages defined by Arm document
>> 111115A v1.0, sections 2.2.1.1, 2.2.2.1 and 2.2.3. Map transport
>> UIDs to PCC subspaces for common and protocol-exclusive A2P and P2A
>> channels, validate the mappings, and cache them for channel setup.
>> 
>> Support the Powercap and System Telemetry protocol properties and add
>> the System Telemetry protocol ID. Implement PCC channel management,
>> message framing, shared-memory bounds validation, and response and
>> notification delivery.
>> 
>> Add the corresponding Kconfig, module and ARML0001 ACPI matching
>> plumbing.
>> 
>> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
>> ---
>>  drivers/firmware/arm_scmi/common.h            |  11 +
>>  drivers/firmware/arm_scmi/transports/Kconfig  |  12 +
>>  drivers/firmware/arm_scmi/transports/Makefile |   2 +
>>  drivers/firmware/arm_scmi/transports/pcc.c    | 867 ++++++++++++++++++++++++++
>>  include/linux/scmi_protocol.h                 |   1 +
>>  5 files changed, 893 insertions(+)
>> 
>> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
>> index 7fc9560dc4ea..ef5e19ecfe20 100644
>> --- a/drivers/firmware/arm_scmi/common.h
>> +++ b/drivers/firmware/arm_scmi/common.h
>> @@ -468,6 +468,17 @@ struct scmi_transport_core_operations {
>>  	const struct scmi_message_operations *msg;
>>  };
>>  
>> +struct scmi_dsd_info {
>> +	u32 protocol_id;
>> +	const char *const property_name;
>> +};
>> +
>> +static const struct scmi_dsd_info scmi_dsd_info_list[] __maybe_unused = {
>> +	{ SCMI_PROTOCOL_BASE, "arm-arml0001-transport-pcc" },
>> +	{ SCMI_PROTOCOL_POWERCAP, "arm-arml0001-protocol-pcap" },
>> +	{ SCMI_PROTOCOL_TELEMETRY, "arm-arml0001-protocol-telemetry" },
>> +};
>> +

> [Below is copied from sashiko-bot@kernel.org review comments Severity: High]
>
> Since scmi_dsd_info_list is defined as a static const array in a header file,
> won't this cause the array to be duplicated in the .rodata section of every
> translation unit that includes common.h?

> Could this array be defined in a .c file and exported via extern to prevent
> unnecessary binary bloat?

Although the header gives each translation unit its own definition, unused
instances are discarded by the compiler. The table is referenced only by
the SCMI core and PCC transport, which are separate modules. Moving it to a
C file would require exporting the table and its size between those modules.
Given that each emitted table is only 48 bytes, I prefer to avoid that
additional interface and keep the local copies.

-- 
Regards,
Sudeep

