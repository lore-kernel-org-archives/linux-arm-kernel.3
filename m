Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA18CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 12:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8KHtOlsr90yhD2rGuVVnFxT47aP8oLr2JK50jkH/W9E=; b=PKeFhGGlPiIlti3wa+ts55HRe2
	feOeg7FHmSW00mVGwGUcHNJUAk5BPvRRPXxh/i6XR109YU4LRPUC0HH0nHgr9yWGt0jttGK6wpBq5
	tpMJEltm3qMvx65XRIuWXwNRzRAEy0Xs7fS9obfoZLaJTvqGRFp50cNIOEe32PQMh3xX/bofj76o1
	hqGGec9cd09KbOFegLF2SJG5tFlhgiSRYwykTocXqBB2fG/7SNZBDAOqjOQBsYTs1G7CEfCxQ5wJT
	vayoRI3tVQHW0yfTr8PD6Xum1ZD66blQZrRTWo8sb6DkmMzrAAj5ab9KysvO5U4Qp20V9AJY63tG4
	5x2u8l7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUNA-0000000HBO2-2OnG;
	Mon, 25 May 2026 12:25:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUN9-0000000HBNs-2wvm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 12:25:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 187F7600BB;
	Mon, 25 May 2026 12:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5F41F000E9;
	Mon, 25 May 2026 12:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779711930;
	bh=8KHtOlsr90yhD2rGuVVnFxT47aP8oLr2JK50jkH/W9E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Fw3mttdFwKIGyqQvkdD80S0Jqg8+gB1hpM57uQ1bWe0+dYInP09EBKc3EQFGelKY8
	 /Vz3KcNLIAPXAKXj1NzPDHsq/RcWWRZtf2ykOjBDK0hJrrNdWnQrGknl/cJBGHlaFn
	 RCGAEi3qr6dMh1uJ0O/GPYkvFitkDN6v0gDF/lOAvjFU72vSMtWQtABv5nwfcipL/f
	 VGiasHVHACNYzqfjbj1DMBiHO1Tfpjk1QPurRaVKNyRYnM6KbbxOlbI+GSJvvqaggh
	 /mYqLXF/LeQesG0pmaJfDpRPV/4es3MWsbucciUb/2BNuSfQA/CjHc5B9jS0IBTQ5t
	 gXuYpMv2mxSrg==
Message-ID: <a59c6e3a-6092-4114-8961-c2a71a812959@kernel.org>
Date: Mon, 25 May 2026 14:25:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] firmware: samsung: acpm: TMU support and cleanups
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 peter.griffin@linaro.org, jyescas@google.com, kernel-team@android.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
 <177965159562.32222.17454581524471571236.b4-ty@b4>
 <DIR9DLGP2EN5.21HR8BY11G5SF@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <DIR9DLGP2EN5.21HR8BY11G5SF@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 25/05/2026 00:26, Alexey Klimov wrote:
> On Sun May 24, 2026 at 8:40 PM BST, Krzysztof Kozlowski wrote:
>>
>> On Fri, 15 May 2026 09:32:24 +0000, Tudor Ambarus wrote:
>>> This series introduces protocol support for the Exynos
>>> Thermal Management Unit (TMU) to the ACPM driver, alongside several
>>> cleanups.
>>>
>>> Dependencies
>>> ============
>>> Krzysztof, these patches together with the acpm fixes from your `fixes`
>>> branch will be needed by the thermal maintainers. I'm going to send the
>>> ACPM TMU (thermal) driver for review. In case they'll take it for the
>>> next release, we'll need an immutable tag with the acpm fixes, cleanup
>>> and thermal helpers. Thanks!
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/6] firmware: samsung: acpm: Consolidate transfer initialization helper
>>       https://git.kernel.org/krzk/linux/c/43d3733b7ffd82b2bfeda69befa2a179335dfe6c
>> [2/6] firmware: samsung: acpm: Annotate rx_data->cmd with __counted_by_ptr
>>       https://git.kernel.org/krzk/linux/c/7b20fd06f783c1e901d34305c68df16212cdf669
>> [3/6] firmware: samsung: acpm: Drop redundant _ops suffix in acpm_ops members
>>       https://git.kernel.org/krzk/linux/c/ef1109e4b6120a52be1ea66d486d6744d0c5ac47
>> [4/6] firmware: samsung: acpm: Make acpm_ops const and access via pointer
>>       https://git.kernel.org/krzk/linux/c/e694e19bf7db26ee324ff6bb450cc523592f5bee
>> [5/6] firmware: samsung: acpm: Add TMU protocol support
>>       https://git.kernel.org/krzk/linux/c/f6af402de525d0848fc4a50f25ff01f56fc68d98
> 
> That commit contained the questionable error conversion which works
> only for gs101 -- acpm_tmu_to_linux_err() hides some sensible errors into -EIO.
> There were on-going discussion on maillist.
> 
> Now, it is needed to ignore that or generalise that or split it to have
> different SoCs if needed. Some re-work will be needed.

That patch was looking correct in its scope. It solved one particular
case (GS101) without stopping anyone to grow this to support other cases
(Exynos850 etc)., so it is in kernel spirit to take such things. Solving
these other cases is simply not necessary now. It's also not blocked, so
just build on top and improve that code to match both use cases, when
you have exynos850 consumer of this.

Best regards,
Krzysztof

