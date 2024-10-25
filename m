Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664B2D149C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 16:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a8cGWjeBVtubT1nOUtGsNOA8VZMw6hKLHJizMjgK7rM=; b=q3QBuPgzSa5eM3ssMpcJbhJXw8
	vwvpFxAG2X77GRemcAuD04MduA0ItWwiFNivWFeJsdjOmEYToHjCJuIAGiCbfb5cqK9NjKjPNhMuh
	PvFwYtmXvDRjKNMF21t9Tb0poa3SomQxBWVQ/F5F6I2r18hSGnKItIex7HNJaHD9E9qtqAx0tdkjs
	GzOzjD5HaEh4vXtxylMadF5b2nQq868IRDDue6UQSbNpTY3Z7hUdIA0pu67zdtRLZc6/L05LOrKJn
	cwP9wZdmDvD0xaUrtZGf5lmnPMy3LghszPnt6WPzOlxOxWQ0U22ZbS+rXweC80xAnaQ6WpX+AyTjJ
	kvREWHQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NDc-00000004Rna-3AcT;
	Fri, 25 Oct 2024 16:31:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LlW-000000047Lh-3RDy
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Oct 2024 14:58:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=a8cGWjeBVtubT1nOUtGsNOA8VZMw6hKLHJizMjgK7rM=; b=K5A30f2hu5ejm+W3D+SDLZxQar
	q4AnKD1LCIXJVC6i3sIHtI1TjAWlgoS5FrSnVAwrQE8MzMYZ5RPgDWuPQ94MAqhI2UpVirc7y0/v6
	OKCyg3epCt357seMgBKxZi6P4hPN2V45MF2vSUotlcs4C/ha52dxcItXVAaNMSogHAGbUrQ+WQJY2
	UZvLgsufWga/kmFSfz77DpW1CBTfi+eJssaQuU72XzH/xWsSEKIgAsJ9Lm5Wq+azcSp4OuA+aC4nX
	c18kOrOKach68gDXzX0QJe28sTF3OsETrUa6pjVTWXoi7yqARuJh5l2c2WoJ0pCZq1ZyADGde6vc/
	ZzCVvIZA==;
Received: from out-185.mta1.migadu.com ([2001:41d0:203:375::b9])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LlS-00000008xEL-236t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 14:58:13 +0000
Message-ID: <07766e5e-6009-4b8e-8a50-30ba0fe763f5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729868285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a8cGWjeBVtubT1nOUtGsNOA8VZMw6hKLHJizMjgK7rM=;
	b=lsT0ohrOh5E5xFM4/dj8E2d6LS9jzHhErfRZvWVngnIdLZIK7DuzuMzxTL+5FIV4LeCWN+
	U/20Ma87/13Nzno2oI+HQ5PtOK5L7+Jks9xkOZWaXhupqk0lEsFH/AtfUIT+Sa7/dD0CJJ
	yt+rOq5RPn/O0mA6h1enlPz24Aq4YXI=
Date: Fri, 25 Oct 2024 10:58:00 -0400
MIME-Version: 1.0
Subject: Re: [PATCH v6 0/8] drm: zynqmp_dp: IRQ cleanups and debugfs support
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 David Airlie <airlied@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Sagar, Vishal" <vishal.sagar@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org
References: <20240809193600.3360015-1-sean.anderson@linux.dev>
 <5e9769dd-459a-4ff3-aebb-bb7057192733@linux.dev>
 <a023bd66-8f42-4f27-9aa2-5097b2574562@ideasonboard.com>
 <e959a01f-b466-4076-8219-a6c83a7194c0@linux.dev>
Content-Language: en-US
In-Reply-To: <e959a01f-b466-4076-8219-a6c83a7194c0@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_155811_792804_A0B61357 
X-CRM114-Status: GOOD (  26.23  )
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

Hi Tomi,

On 10/3/24 10:53, Sean Anderson wrote:
> On 10/2/24 10:50, Tomi Valkeinen wrote:
>> Hi,
>> 
>> On 01/10/2024 21:31, Sean Anderson wrote:
>>> On 8/9/24 15:35, Sean Anderson wrote:
>>>> This series cleans up the zyqnmp_dp IRQ and locking situation. Once
>>>> that's done, it adds debugfs support. The intent is to enable compliance
>>>> testing or to help debug signal-integrity issues.
>> 
>> I think the patches 1-7 look fine, and I think I can pick those already to drm-misc if you're ok with that.
>> 
>> I'm a bit unsure about patch 8, probably mainly because I don't have experience with the compliance testing.
>> 
>> How have you tested this? With some DP analyzer/tester, I presume?
> 
> For my test setup I used an oscilloscope hooked up to the displayport
> output using a fixture that broke the signals out to SMA. Since the
> oscilloscope cannot emulate a sink, I first had the output connected to
> a monitor. Then I disabled HPD and reconnected the output to my fixture.
> This process is described in more detail in the documentation.
> 
>> I think none of this (patch 8) is needed by almost anybody.
> 
> Well, I found it very useful for debugging a signal integrity issue I
> was having. Once I could have a look at the signals it was very clear
> what the problem was.
> 
>> Even among zynqmp_dp developers I assume it's very rare to have the
>> hardware for this. I wonder if it would make sense to have the debugfs
>> and related code behind a compile option (which would be nice as the
>> code wouldn't even compiled in), or maybe a module parameter (which
>> would be nice as then "anyone" can easily enable it for compliance
>> testing). What do you think?
> 
> Other drivers with these features just enabled it unconditionally, so I
> didn't bother with any special config.
> 
>> I also somehow recall that there was some discussion earlier about
>> how/if other drivers support compliance testing. But I can't find the
>> discussion. Do you remember if there was such discussion, and what was
>> the conclusion? With a quick look, everything in the debugfs looks
>> generic, not xilinx specific.
> 
> The last it got discussed was back in [1], but I never got any further
> response. I agree that some of this is generic, and could probably be
> reworked into some internal helpers. But I don't have the bandwidth at
> the moment to do that work.
> 
> --Sean
> 
> [1] http://lore.kernel.org/dri-devel/cda22b0c-8d7c-4ce2-9a7c-3b5ab540fa1f@linux.dev

Does this all make sense to you? At the moment I don't believe I have any
changes I need to resend for (although this series is archived in patchwork [1]
for some reason).

--Sean

[1] https://patchwork.kernel.org/project/dri-devel/list/?series=878338&archive=both

