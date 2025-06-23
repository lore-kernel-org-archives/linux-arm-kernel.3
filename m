Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C36C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 16:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0EbzysFzXSx6fbpE2Q3MPF8+aVu47XcRJFl5T1QnUX4=; b=TnmYU0bNU/v9VJ5ESZRHWkZY1r
	qsHAmfygR3PJ00ggSdsdKMrwIgMEHBkRU5RTNBL2lZ7f3DRBnJmOiKg6wFLxztrIC2r1ILK8K948/
	F+w812YdWN9LopYerctWStIivT5PUCFVhQ3tyMFBu3D7CiLIKDmxEaoOMg8ccjS3JE42OnuMhxEQY
	kHYTp2ZBTfAi9RxGi6x0d+JZKwQ96LquJAYf57tL+RMBVztBxbyXQPMzx3EypviqtdeHmYJSe//Mu
	M0/pxALJJYT1oZNg/Y1AIUll3rC3HBzbw2QCFHEYdLhZwm6z2JQyejdjLa1gYZHvAXMQLo1+JSRAV
	wF8BT+Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjag-00000003Kkk-1cNh;
	Mon, 23 Jun 2025 16:00:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgLb-00000002hdg-0YiT;
	Mon, 23 Jun 2025 12:32:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750681945;
	bh=Hi9Eh4Q8Idz+PcP0DJGiXpcq9TCKuca5A6YCe8h1Q6U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fRzoI1dlS3MhNk3kaIep6i4WWNWcAedful78drVRlvm/4Xh1SkS3K+ztOxFgSXAoH
	 2vbxKawbsztUnl09cPgSt+uFvVJ1tHS6KKrdllwE7bz4z7Nx8fjloQ81iDlj4Xj79Q
	 /D5ypsq0jDLDquYdSE6sGH6Vs3QoA6d6ufaxnnBWl5rl/oV0zaA/r9/MsmuncGTLQ/
	 zChQ5ri/Q5UxqkUf8s5FwHisxQIwpUKH8BYjPGN4ASCoS3jQkHgPzClBohAjnAg3zh
	 ePgONva+hO8UErkrt4zINF+7jcMmK0nTWjXo4ELEAsJk5/M9CCDUjpnlURnSI/Wd6Q
	 usJOc2BEtxn3w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 13E9717E05BD;
	Mon, 23 Jun 2025 14:32:25 +0200 (CEST)
Message-ID: <9e8d0dfc-7dc4-461d-afd9-bd381219422f@collabora.com>
Date: Mon, 23 Jun 2025 14:32:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] firmware: Add MediaTek TinySYS SCMI Protocol
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, sudeep.holla@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, arm-scmi@vger.kernel.org,
 kernel@collabora.com
References: <20250623120136.109311-1-angelogioacchino.delregno@collabora.com>
 <aFlFw-AjqxXcIuBO@pluto>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <aFlFw-AjqxXcIuBO@pluto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_053227_324490_BE32C126 
X-CRM114-Status: GOOD (  18.86  )
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

Il 23/06/25 14:17, Cristian Marussi ha scritto:
> On Mon, Jun 23, 2025 at 02:01:34PM +0200, AngeloGioacchino Del Regno wrote:
>> This series adds basic support for the MediaTek TinySYS SCMI Protocol,
>> found on the MediaTek Dimensity 9200, 9300 and 9400, other than on the
>> MT8196 Chromebook SoC.
>>
>> This is used to communicate with the CM_MGR and other MCUs for power
>> management purposes.
> 
> Hi Angelo,
> 
> thanks for this.
> 
> I will do a proper review in the coming days of this series anyway, but
> upfront for future V2:
> 
> - you should provide some sort of documentation for this new
>    vendor protocol and its messages, as an example from IMX:
> 
> 	drivers/firmware/arm_scmi/vendors/imx/imx95.rst

Noted.

> 
> - where is the SCMI driver that will call all the new vendor ops
>    defined in: scmi_mtk_protocol.h ?

This was tested with code that is not clean at all (hence I can't push it upstream)
and well... I didn't think about the fact that, effectively, without an user, this
code ends up being unused.

I can't promise to send a clean user in this cycle, but I would really appreciate
if you could still check the protocol code, so that if there's anything that you
can spot I can fix it while the rest gets done :-)

Thank you,
Angelo

> 
> Thanks,
> Cristian



