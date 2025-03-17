Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7937CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 10:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3u1bGlfHbPacN1nCsyuTjD60f8Tzd91LwsrgmDR5xo=; b=HZr20nYSK6dPilt7Q7ulBt6BoS
	dyx9ZOz5w16x5aU7UxyKVDvo525SsZy2LrtxCn+xWl+fYjeVd4r1dyhHlOrdhhsT6Fgkp4ijL5WD2
	rDtRE1f2D9tBevO5NhMnBhLPPT6M9ZSZ4FcEeLAhYno4scaJOTjVuwJKirEdY3VcWEXaDRDCqdXi3
	uKBKO3/nxElxXFzbKcqJoycjDD2jdStXQW+5uLO/+1M2hFQydxubFHb4Rs3Yn3Vzsn2SVeEfpF3gu
	1Myjl9aUjXzw0KmYfNBzqlz+C51yPCS0uUgfFXqndZeCROdtzEB3qdjtLApUh3DKYc8LTFtR1PlqI
	a0+OpcjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7Pd-000000024J2-0WG7;
	Mon, 17 Mar 2025 10:09:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7Nu-000000023mF-2ERA;
	Mon, 17 Mar 2025 10:07:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742206068;
	bh=8lS5hmgPL3TYuQclYZ9vfPxIWeswa/Pdrh0fXPBcwWA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DEPD6TQb2muBQx4U2eHrGHZLYQx3/7kW6Fli7xueDlalRM/j9T8zhrj/vuRfyUy3B
	 EW2VLZvytpoeGtcJkbhKJrPDlZ870TCWsvtom80M6Ai3BOkLBDUgnpnFnbpTYgP+s9
	 x9vEqQWUyO+AwmMjAGX7hszhkKEI/ecu3gUrNtzZNWMrPXJEVz31GshUMquLPrQZYg
	 3KSL9ajKzChu9PJGectraGgPEM9apNi6JuKASwlWkwBamNEVXRBvGwI2PEtBifXf0C
	 EvKs962aMsWgUHm+2a7BQLFSImlkAjQG3x+YUtPKidztC2TUQVXHXMiJLcw1dAJSda
	 1SfI6F9mH3nRg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2619217E0385;
	Mon, 17 Mar 2025 11:07:48 +0100 (CET)
Message-ID: <375d5281-41f5-49e8-ac20-d58931c0c1f9@collabora.com>
Date: Mon, 17 Mar 2025 11:07:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 0/3] add VCP mailbox and IPC driver
To: Jjian Zhou <jjian.zhou@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20250317083822.891-1-jjian.zhou@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250317083822.891-1-jjian.zhou@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_030750_745837_5863CDEA 
X-CRM114-Status: GOOD (  21.28  )
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

Il 17/03/25 09:38, Jjian Zhou ha scritto:
> The VCP mailbox has 5 groups. Each group has corresponding interrupts,
> registers, and 64 slots (each slot is 4 bytes). Since different features
> share one of the mailbox groups, the VCP mailbox needs to establish a
> send table and a receive table. The send table is used to record the
> feature ID, mailbox ID, and the number of slots occupied. The receive table
> is used to record the feature ID, mailbox ID, the number of slots occupied,
> and the receive options. The API setup_mbox_table in mtk-vcp-ipc.c calculates
> the slot offset and pin index for each feature ID based on the mailbox ID and
> slot number in the send and receive tables (several slots form a pin, and
> each pin can trigger an interrupt). These descriptions are written in the
> mtk-vcp-ipc.c file -- we call it the IPC layer.
> 
> We have two questions:
> How should we describe the mailbox and IPI?
> Can the intermediate IPC layer be rewritten as a virtual mailbox layer?
> 

So, for this remote processor messaging system you have:
  - Dynamic channel allocation
    - Each channel has its own endpoint
    - Each channel has its own interrupt
  - Data send operation
    - Both with and without ACK indication from the remote processor
    - To channel -> endpoint
  - Data receive operation
    - From channel <- endpoint
    - When interrupt fires
    - Could use polling to avoid blocking in a few cases
  - A custom message structure not adhering to any standard

Check drivers/rpmsg/ :-)

On MediaTek platforms, there are many IPI to handle in many subsystems for
all of the remote processors that are integrated in the SoC and, at this
point, you might as well just aggregate all of the inter processor communication
stuff in one place, having an API that is made just exactly for that, instead
of keeping to duplicate the IPI stuff over and over (and yes I know that for each
remote processor the TX/RX is slightly different).

If you aggregate the IPI messaging in one place, maintenance is going to be easier,
and we stop getting duplication... more or less like it was done with the mtk_scp
IPI and mtk-vcodec .. and that's also something that is partially handled as RPMSG
because, well, it is a remote processor messaging driver.

Just to make people understand *how heavily* MediaTek SoCs rely on IPI, there's
a *partial* list of SoC IPs that use IPI communcation:

thermal, ccu, ccd, tinysys, vcp, atsp, sspm, slbc, mcupm, npu, mvpu, aps, mdla,
qos, audio, cm_mgr.... and... again, it's a partial list!

That said... any other opinion from anyone else?

Cheers,
Angelo

> Example of send and recve table:
> Operation | mbox_id | ipi_id | msg_size | align_size | slot_ofs | pin_index |  notes
> send          0          0       18          18           0          0
> recv          0          1       18          18          18          9
> send          1         15        8           8           0          0
> send          1         16       18          18           8          4
> send          1          9        2           2          26         13
> recv          1         15        8           8          28         14       ack of send ipi_id=15
> recv          1         17       18          18          36         18
> recv          1         10        2           2          54         27       ack of send ipi_id=2
> send          2         11       18          18           0          0
> send          2          2        2           2          18          9
> send          2          3        3           4          20         10
> send          2         32        2           2          24         12
> recv          2         12       18          18          26         13
> recv          2          5        1           2          44         22
> recv          2          2        1           2          46         23
> 
> Recv ipi_id=2 is the ack of send ipi_id=2(The ipi_id=15 is the same.)
> 
> Jjian Zhou (3):
>    mailbox: mediatek: Add mtk-vcp-mailbox driver
>    firmware: mediatek: Add vcp ipc protocol interface
>    dt-bindings: mailbox: mtk,vcp-mbox: add mtk vcp-mbox document
> 
>   .../bindings/mailbox/mtk,mt8196-vcp-mbox.yaml |  49 ++
>   drivers/firmware/Kconfig                      |   9 +
>   drivers/firmware/Makefile                     |   1 +
>   drivers/firmware/mtk-vcp-ipc.c                | 481 ++++++++++++++++++
>   drivers/mailbox/Kconfig                       |   9 +
>   drivers/mailbox/Makefile                      |   2 +
>   drivers/mailbox/mtk-vcp-mailbox.c             | 179 +++++++
>   include/linux/firmware/mediatek/mtk-vcp-ipc.h | 151 ++++++
>   include/linux/mailbox/mtk-vcp-mailbox.h       |  34 ++
>   9 files changed, 915 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mailbox/mtk,mt8196-vcp-mbox.yaml
>   create mode 100644 drivers/firmware/mtk-vcp-ipc.c
>   create mode 100644 drivers/mailbox/mtk-vcp-mailbox.c
>   create mode 100644 include/linux/firmware/mediatek/mtk-vcp-ipc.h
>   create mode 100644 include/linux/mailbox/mtk-vcp-mailbox.h
> 




