Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDD6C36014
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 10:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kjj9M+5hE6ISrmJlHywt4Gt2p0MArRT9sdYYQT+5XEM=; b=zfgZdOSEkTfXsqGyNqj+aZvxyY
	nQmBfZ5NbWmgH3v13LB+n/tTXI8Gh40ZAZgEgelbAmhmXbZq2N7oabcu6dhgQ4QMTjEDA8lUGXdFo
	vXdTl4qcy1DtebfkWChFN69CaAQW2QeGIi2QA5MKjsqphe5YOejehGcjZfaynE7YPAyrM/V4wsF9R
	fjmTm7zqEPzsbwY57ywjTEZzdDnxS4YgZJzxVdg5CsERBqRB9mUZ3aCfo2QH9W/0ZoFuqFTGM7auk
	o2a7/TUNZD0eiG8sYc6ZhuxWtm/KaN/WllzFdapPFg3hDuSrTy4ZZ5dywa1K632mcYZQhp4NTFVve
	bL04FA1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzutU-00000005kDO-1aVA;
	Wed, 02 Apr 2025 10:00:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzuri-00000005jwo-3QTP;
	Wed, 02 Apr 2025 09:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743587913;
	bh=A6B6aja2eONivCgEbLNhcYTNJ9Aom1x9SvOr3WEMcrM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GR4SvVWhvJKv4gRuNuMausHmiTwn543Qnc8f4Rmx+I+ZARUjbVOE4lnWcp8uTQcZd
	 +fXNpHoB9Dc3FF79M7JCJaL4vkZddfWt+Ldp0g1TtAWbwxx7En80sWnmW8Nkefyi8N
	 2Chbk/mzHEgl4hc9oWyiVY7J/7gaOo+YIiQzzqIRW78p2V2RrBd+88YWgM38JQ+8R8
	 vNsyXiFHYd5MwVslnActKE4WXLIax+Jw8LwF62wC72c2PJM7PP4HfPIfYFapDGxyNn
	 mw2bB5ZkMu810VYd/rWAWFMMtiF+JxjNH6ECSKbwmkrBAWe4fptyEFSQm4AFbe45h9
	 nQTL29i0Ho6uw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7423717E014F;
	Wed,  2 Apr 2025 11:58:32 +0200 (CEST)
Message-ID: <dbc60fcb-1759-49e8-90da-6afce5075fbf@collabora.com>
Date: Wed, 2 Apr 2025 11:58:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 0/3] add VCP mailbox and IPC driver
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Jjian Zhou <jjian.zhou@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250317083822.891-1-jjian.zhou@mediatek.com>
 <375d5281-41f5-49e8-ac20-d58931c0c1f9@collabora.com>
 <CAGXv+5G4KRbv=qcKurn5u300XPp4KNovmUD9OBfX7mKk57tucg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5G4KRbv=qcKurn5u300XPp4KNovmUD9OBfX7mKk57tucg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_025835_191493_7FB8AA7C 
X-CRM114-Status: GOOD (  47.83  )
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

Il 18/03/25 08:44, Chen-Yu Tsai ha scritto:
> On Mon, Mar 17, 2025 at 6:07 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 17/03/25 09:38, Jjian Zhou ha scritto:
>>> The VCP mailbox has 5 groups. Each group has corresponding interrupts,
>>> registers, and 64 slots (each slot is 4 bytes). Since different features
>>> share one of the mailbox groups, the VCP mailbox needs to establish a
>>> send table and a receive table. The send table is used to record the
>>> feature ID, mailbox ID, and the number of slots occupied. The receive table
>>> is used to record the feature ID, mailbox ID, the number of slots occupied,
>>> and the receive options. The API setup_mbox_table in mtk-vcp-ipc.c calculates
>>> the slot offset and pin index for each feature ID based on the mailbox ID and
>>> slot number in the send and receive tables (several slots form a pin, and
>>> each pin can trigger an interrupt). These descriptions are written in the
>>> mtk-vcp-ipc.c file -- we call it the IPC layer.
>>>
>>> We have two questions:
>>> How should we describe the mailbox and IPI?
>>> Can the intermediate IPC layer be rewritten as a virtual mailbox layer?
>>>
>>
>> So, for this remote processor messaging system you have:
>>    - Dynamic channel allocation
>>      - Each channel has its own endpoint
> 
> The rpmsg model has:
> 
> - device -> the remote processor
> - channel
> - endpoint
> 
> However here for the VCP and possibly all the coprocessors using the
> tinysys model, channel and endpoint are basically the same.

For now, yes. Though, I expect multiple endpoints to become a thing in future
iterations of MediaTek SoCs, and this is based off how the hardware seems to
be evolving.

> If we
> consider the "channel" to be the storage plus the interrupt vector,
> and the "endpoint" to be the function running on the remote processor
> servicing a given IPI ID, then it's always one endpoint per channel.

Like this, yes - but if you consider ipi_id as the endpoint things will change.

Alternatively, if you consider the endpoint as function running on the remote
processor as you propose, and that I think could be the better alternative,
I still expect functions to grow in future SoCs.

> 
> IMHO rpmsg gives too much latitude to make things confusing here.
> 
> rpmsg also requires the remote processor to support name service
> announcements, which really doesn't exist.

I have doubts about that: all this is not properly documented and a kind of
service announcement could actually be existing - but let's assume that it
does not as that's the right thing to do.

There's still a way around that anyway, and even though it's not the prettiest
thing on Earth, it's not a big deal imo.

> The endpoints and how
> they map to the various hardware mailbox interrupt vectors and
> storage is statically allocated, and thus needs to be described
> in the driver.
> 

I'm not sure I understand this sentence, but it feels like this can be avoided
by simply using a cell in devicetree.

rpmsg = <&something 1 0>;  or  rpmsg = <&something 0>;

>>      - Each channel has its own interrupt
>>    - Data send operation
>>      - Both with and without ACK indication from the remote processor
>>      - To channel -> endpoint
>>    - Data receive operation
>>      - From channel <- endpoint
>>      - When interrupt fires
>>      - Could use polling to avoid blocking in a few cases
>>    - A custom message structure not adhering to any standard
>>
>> Check drivers/rpmsg/ :-)
> 
> While discussing this internally, I felt like that wasn't a really
> correct model. IIUC rpmsg was first created to allow userspace to
> pass messages to the remote processor. Then somehow devices were
> being created on top of those channels.
> 

Heh, if I recall correctly, I did see some userspace messaging in one of the
downstream kernels for other chips that are heavily using the IPI - check below
for a model hint :-)

> Also, the existing mtk_rpmsg driver seemed a bit weird, like requiring
> a DT node for each rpmsg endpoint.
> 

Weird... it's weird, agreed - but I call that necessary evil.
The other way around could be worse (note: that statement is purely by heart and
general knowledge around MediaTek SoCs, not about any specific code in particular).

> That's why I thought mailboxes made more sense, as the terminology mapped
> better. As a result I never brought up rpmsg in the discussion.

I think I do understand your thinking here - and I am not *strongly* disagreeing,
but I don't really agree for the reasons that I'm explaining in this reply.

> 
> Perhaps that could be improved with better documentation for the MediaTek
> specific implementation.
> 

Now that's what I'd really like to see here, because I feel like many things around
MediaTek SoCs are suboptimally engineered (in the software sense, because in the HW
sense I really do like them) and the *primary* reason for this is exactly the lack
of documentation... -> even internally <-.

>> On MediaTek platforms, there are many IPI to handle in many subsystems for
>> all of the remote processors that are integrated in the SoC and, at this
>> point, you might as well just aggregate all of the inter processor communication
>> stuff in one place, having an API that is made just exactly for that, instead
>> of keeping to duplicate the IPI stuff over and over (and yes I know that for each
>> remote processor the TX/RX is slightly different).
>>
>> If you aggregate the IPI messaging in one place, maintenance is going to be easier,
>> and we stop getting duplication... more or less like it was done with the mtk_scp
>> IPI and mtk-vcodec .. and that's also something that is partially handled as RPMSG
>> because, well, it is a remote processor messaging driver.
>>
>> Just to make people understand *how heavily* MediaTek SoCs rely on IPI, there's
>> a *partial* list of SoC IPs that use IPI communcation:
>>
>> thermal, ccu, ccd, tinysys, vcp, atsp, sspm, slbc, mcupm, npu, mvpu, aps, mdla,
>> qos, audio, cm_mgr.... and... again, it's a partial list!
> 
> Indeed, the newest chip has become quite complicated.
> 

..and I'd like to add: for many good reasons :-)

>> That said... any other opinion from anyone else?
> 
> I tried to describe why I thought a virtual mailbox was better.
> 

The implementation issue arising with a virtual mailbox driver is that then each
driver for each IP (thermal, ccu, vcp, slbc, this and that) will contain a direct
copy of the same part-two implementation for IPI communication: this can especially
be seen on downstream kernels for MediaTek Dimensity 9xxx smartphone chips.

If done with a mailbox, there's going to be no way around it - describing it all
will be very long, so I am not doing that right now in this reply, but I invite
you to check the MT6989 kernel to understand what I'm talking about :-)

Cheers!

> 
> Thanks
> ChenYu
> 
>> Cheers,
>> Angelo
>>
>>> Example of send and recve table:
>>> Operation | mbox_id | ipi_id | msg_size | align_size | slot_ofs | pin_index |  notes
>>> send          0          0       18          18           0          0
>>> recv          0          1       18          18          18          9
>>> send          1         15        8           8           0          0
>>> send          1         16       18          18           8          4
>>> send          1          9        2           2          26         13
>>> recv          1         15        8           8          28         14       ack of send ipi_id=15
>>> recv          1         17       18          18          36         18
>>> recv          1         10        2           2          54         27       ack of send ipi_id=2
>>> send          2         11       18          18           0          0
>>> send          2          2        2           2          18          9
>>> send          2          3        3           4          20         10
>>> send          2         32        2           2          24         12
>>> recv          2         12       18          18          26         13
>>> recv          2          5        1           2          44         22
>>> recv          2          2        1           2          46         23
>>>
>>> Recv ipi_id=2 is the ack of send ipi_id=2(The ipi_id=15 is the same.)
>>>
>>> Jjian Zhou (3):
>>>     mailbox: mediatek: Add mtk-vcp-mailbox driver
>>>     firmware: mediatek: Add vcp ipc protocol interface
>>>     dt-bindings: mailbox: mtk,vcp-mbox: add mtk vcp-mbox document
>>>
>>>    .../bindings/mailbox/mtk,mt8196-vcp-mbox.yaml |  49 ++
>>>    drivers/firmware/Kconfig                      |   9 +
>>>    drivers/firmware/Makefile                     |   1 +
>>>    drivers/firmware/mtk-vcp-ipc.c                | 481 ++++++++++++++++++
>>>    drivers/mailbox/Kconfig                       |   9 +
>>>    drivers/mailbox/Makefile                      |   2 +
>>>    drivers/mailbox/mtk-vcp-mailbox.c             | 179 +++++++
>>>    include/linux/firmware/mediatek/mtk-vcp-ipc.h | 151 ++++++
>>>    include/linux/mailbox/mtk-vcp-mailbox.h       |  34 ++
>>>    9 files changed, 915 insertions(+)
>>>    create mode 100644 Documentation/devicetree/bindings/mailbox/mtk,mt8196-vcp-mbox.yaml
>>>    create mode 100644 drivers/firmware/mtk-vcp-ipc.c
>>>    create mode 100644 drivers/mailbox/mtk-vcp-mailbox.c
>>>    create mode 100644 include/linux/firmware/mediatek/mtk-vcp-ipc.h
>>>    create mode 100644 include/linux/mailbox/mtk-vcp-mailbox.h
>>>
>>
>>
>>

