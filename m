Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C872FCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 00:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RWVBflFwjlDMx02obbG1O8/9v7J72jOs6oQiz8ciEK0=; b=hvFSUjMiUFpYwRkYrLD0aK54Q4
	xmvTusdljlLPlRtKLcsnpOogedfGc6kCE9uRm2U/JHsAYGDqXaLJvFjOlyOc9lrZX7OOb63jtfWZn
	GZW3chRlodTVB84JFHtXYgsLinCt/Gzl/yZm4SL4J0J4Q8I9lRkAbXfPpS20exhGgSficq/r/tIFy
	AFa7+0vsUIN0MQE+prmsP3qg1/UaFmCSqJ/sgJs7ovgdt7km5Q/xLJSwLgrK2p43nElm9XoofAIXj
	vDMamgrTO3OE/I0Vv1ZQggO8x9CzdXmPUCxObxygQnTr/xz0p/b6DY5FgQ93dYDXxxPdncXfh24xz
	yRHpfinA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG4oq-0000000AqDG-1RNb;
	Tue, 04 Nov 2025 00:22:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG4oo-0000000AqCr-3C74
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 00:22:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CBC15601D7;
	Tue,  4 Nov 2025 00:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E086C4CEE7;
	Tue,  4 Nov 2025 00:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762215757;
	bh=b9CZ+VB3UXS0C3cTQaC/sdKRLZE5rzAOC3vy3hu5KMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ttY1tiFm8W5I8B4z2PfG5pKGVRZCrl8YOIScu4Oo4kjqWGBQzmACXgACg0wXn/2Gs
	 XyVn+O9bMNwCga05VqO0nSGhlBxyl3Oaz6612cCJxERCWYo4Puzav9k2ViiI+Vxh3T
	 TxeLVu8qy8ZdMzEXxVpU6W8Hw+4rTr/9iGeykOYNiIB1FY4m9su6DG2cyh940falxh
	 1XybPt1Kfx0SrzyaJn8481kjiFrzr099MqooQxcBRuWvfbxXHg/QqmYllwEp9vZq09
	 8Pp6OT/p84QAna3LFcRepcRCtFtH2vI4CmboqYfvLZQkuWXYQeyVoKaey9bmY5kPEE
	 Mt+Y+HHrZpG2Q==
Date: Mon, 3 Nov 2025 19:22:36 -0500
From: Sasha Levin <sashal@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: patches@lists.linux.dev, stable@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH AUTOSEL 6.17-6.12] soc: sunxi: sram: add entry for a523
Message-ID: <aQlHTCB-UyA7JrFo@laps>
References: <20251009155752.773732-1-sashal@kernel.org>
 <20251009155752.773732-11-sashal@kernel.org>
 <20251009173801.13c133a4@donnerap.manchester.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251009173801.13c133a4@donnerap.manchester.arm.com>
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

On Thu, Oct 09, 2025 at 05:38:01PM +0100, Andre Przywara wrote:
>On Thu,  9 Oct 2025 11:54:37 -0400
>Sasha Levin <sashal@kernel.org> wrote:
>
>Hi,
>
>> From: Chen-Yu Tsai <wens@csie.org>
>>
>> [ Upstream commit 30849ab484f7397c9902082c7567ca4cd4eb03d3 ]
>>
>> The A523 has two Ethernet controllers. So in the system controller
>> address space, there are two registers for Ethernet clock delays,
>> one for each controller.
>>
>> Add a new entry for the A523 system controller that allows access to
>> the second register.
>>
>> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Link: https://patch.msgid.link/20250908181059.1785605-4-wens@kernel.org
>> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>>
>> LLM Generated explanations, may be completely bogus:
>>
>> YES – this should go to stable; without it the second GMAC on A523
>> cannot program its clock-delay register.
>
>It's pointless, any kernel before v6.15 will not boot on any A523 device,
>so support for any kind of A523 MAC is irrelevant.
>For newer kernels, this would be tied to the GMAC1 enablement, which is
>also a new feature, so not a candidate for stable.

Dropped, thanks!

-- 
Thanks,
Sasha

