Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B4D606D802
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 01:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1oX+jpDJ;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=g3zKO2fI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wYPlcYxWEFPPxDzllayWHKcttt65f1mLVtY971TaG9g=; b=1oX+jpDJXcLaqO
	oiNZuwHTAJY1jnjjTZ9nFIaE0dfEuP45JbUffOeTRkBAk4ChQWrS7WHLUmwCLkfM6Bn7CG8ncQhYb
	bQV51vJu928eWZDA/Vg2gCj3Xsckd8ZeI67LoWCjgr1iMFzOjsunsPfUykKem5yf/QW44Zy8GxH11
	5NcnjgQdogstlRj0cAed5MqIwqA5kZMSznzJiLAzCcq7a2fflOhN9QDttiZA/Ns+UCs4zGw6Ev29g
	jglQGDnbUcMihByLopnKplPGzh0Ix5LU7dWFm3YWg+zL9a0qqBuDp7vRWy3wc3dwXeJ4v5FU4dAqY
	7ZNwy8DKVSS2N9P8om9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOmEs-00000007ThD-1ffy;
	Thu, 05 Nov 2026 01:26:02 +0000
Received: from mail-m1602365393.xmail.ntesmail.com ([160.236.53.93])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOmEl-00000007TfB-1B2Y;
	Thu, 05 Nov 2026 01:26:01 +0000
Received: from [192.168.10.59] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 538ad91db;
	Thu, 5 Nov 2026 09:25:51 +0800 (GMT+08:00)
Message-ID: <8ab021df-dd10-4f29-bacf-9c01c22c7202@rock-chips.com>
Date: Thu, 5 Nov 2026 09:25:50 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: rk3308-codec: describe
 detection and ADC routing
To: Mark Brown <broonie@kernel.org>
Cc: heiko@sntech.de, linux-sound@vger.kernel.org, luca.ceresoli@bootlin.com,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 huangtao@rock-chips.com, sugar.zhang@rock-chips.com, lxt@rock-chips.com,
 xing.zheng@rock-chips.com
References: <20261101040125.1864141-1-zhengxing@rock-chips.com>
 <20261101044149.2018744-1-zhengxing@rock-chips.com>
 <20261101044149.2018744-2-zhengxing@rock-chips.com>
 <aufBA7-uC7udM0qa@sirena.org.uk>
Content-Language: en-US
From: Xing Zheng <zhengxing@rock-chips.com>
In-Reply-To: <aufBA7-uC7udM0qa@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1a94ff11e03a8kunmeffaf22e3a50de
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZT0NKVk0dTEofQk0dHhodGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=g3zKO2fILayjVdGEZOCwKOnfIp7jt4rjJRF3J5aD3fldQeIQB47CNsGCkR6dKMnPT7odmhpFizQdvM2Ru9irAIQkLfADKCosoYb/99wAonx6O+0VOOdiq2L5clqxymPBnknZlowa8rtF1891us3q0aWT1/Tegbm9s8U1vtnTETs=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=wYPlcYxWEFPPxDzllayWHKcttt65f1mLVtY971TaG9g=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_172556_063219_6985F6ED 
X-CRM114-Status: GOOD (  14.62  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mark,

On 11/2/26 06:45, Mark Brown wrote:
> On Sun, Nov 01, 2026 at 12:41:47PM +0800, Xing Zheng wrote:
>> Describe the optional detect-GRF phandle and named interrupt resources
>> used by the B/C headphone detector. Retain the legacy interrupt order
>> and index-based lookup when names are absent. Document the detector
>> disable and reversed-jack properties and their resource dependencies.
> Please don't send new patches in reply to old patches or serieses, this
> makes it harder for both people and tools to understand what is going
> on - it can bury things in mailboxes and make it difficult to keep track
> of what current patches are, both for the new patches and the old ones.

Understood. Any future patch series or revision I submit will start
its own thread, with links to earlier versions in the cover letter.

I am putting this series on hold while I investigate playback and
capture problems observed on our EVB with upstream codec changes
backported to our downstream 6.12 kernel.

Before these backports, sound/soc/codecs/rk3308_codec.c and .h matched
the upstream versions at 2ba2d17170f9 ("ASoC: codecs: rk3308: fix
building without CONFIG_OF"). On top of that codec baseline, I applied
the following upstream commits:

   2d8a091725e6 ASoC: codecs: rk3308: convert to snd_soc_dapm_xxx()
   0c55552b5f5e ASoC: codecs: rk33*: use .auto_selectable_formats
   157f7cba77a9 ASoC: codecs: rk3308: add support for codec revision B

I also backported a1c99b6097af ("ASoC: soc-component: add
snd_soc_component_to_dapm()") for the DAPM accessor used by the
converted driver. These are upstream commit IDs; the rest of the
kernel remains based on downstream 6.12.

I have not yet determined whether the playback and capture issues
are in the upstream driver or in the backport/integration.

I will rework any necessary changes against the current upstream base
and validate playback and capture on the EVB before resubmitting.
Depending on the remaining scope, I will send either a revised v3 of
this series or a separate, focused patch or series. In either case,
the submission will start a new thread and reference the earlier
series where relevant.

Thank you for the review and the threading guidance.

Best Regards
Xing Zheng



