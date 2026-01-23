Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8845D72345
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 07:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvtrGumHQsVFtFDm6zrMR1kuxvoQXy8G0c215Tp0diA=; b=EvmAFhQs/t/ifDpXvjYst2oC6U
	LZJKL2K6M/iphv9acXc7MWuehm0Qmo5ZJb0sRQxF7C+8WW9/pDBqSvSsuc0evu833OPz4CEDBeDvS
	HVxHxbTrhxcSwqFTeYGoIIzRdS6PcWBR+9r33JH7ulxLrtlkMXwdbbFET1vGn5mxVIrfn1AaDabPJ
	4vDx+Gl14YBS/NWXvlH1ZINNDTt3GvI+MbSeumoeRy4/RR2UxlWzAUgUaZFZCWHxo9nU9GNeqW+5i
	fMeprAltQY8EG06j0pLUDvTss/b/qRCjClfDf7jZttfwoggVWpZ2NxMhh25ThwMIfZxdanm140QUe
	v0o4sQ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBpf-00000008OCz-2RJz;
	Fri, 23 Jan 2026 07:43:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBpd-00000008OCU-0Xwg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 07:43:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 837F543677;
	Fri, 23 Jan 2026 07:43:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 759B0C19422;
	Fri, 23 Jan 2026 07:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769154228;
	bh=hNJqMGM1DGrrZMHfT+TOWmjcktsysNTRhH0t2zsZwh8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TKvTDXH4yniIjS5R/1KBh2KeniWAQxfMVz0eMyGploKWx6CpIQ0CqJDezf/md0DRx
	 q4EyisajkmDpFeCVX8KcTMXHMrwtwUI/HJg21w0CAha7cLQaG2d9yGsGZCkPfYDdBi
	 8fQnr9vYA48tSoL3yDO4uCysLDG3EqSNZ/Im62iIz39fMASmzdl0WUlkXTszdm/zwT
	 vSIY8wYQy8qcoF+ktKkMdsbgIEM7yXKm6+ZI6RSH7OdztUQ8DNth0lVm9izBBDiOHe
	 YzRG93qVaQLPVa3h1aDIfM7uG5tRvJ7DnsuGOZEmEyC6Aig4wYph0SZGtDLi15FrH4
	 EXICVgOjgeUYA==
Message-ID: <684526d5-f1ac-46d5-b147-1fb906ba2248@kernel.org>
Date: Fri, 23 Jan 2026 08:43:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
To: Thierry Reding <thierry.reding@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: arm@kernel.org, soc@kernel.org, Jon Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <20260118080304.2646387-1-thierry.reding@gmail.com>
 <20260122-hidden-goat-of-excellence-a43b9f@quoll>
 <CAMuHMdUZqJa3KEWZReA734=ZV98JTD=HPztkszEe6ARFWiuhww@mail.gmail.com>
 <aXIVmW_mjb0AdDwe@orome>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aXIVmW_mjb0AdDwe@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_234349_218288_80A688B1 
X-CRM114-Status: GOOD (  15.58  )
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

On 22/01/2026 13:20, Thierry Reding wrote:
> On Thu, Jan 22, 2026 at 12:02:04PM +0100, Geert Uytterhoeven wrote:
>> Hi Krzysztof,
>>
>> On Thu, 22 Jan 2026 at 11:08, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>> On Sun, Jan 18, 2026 at 09:03:00AM +0100, Thierry Reding wrote:
>>>> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
>>>>
>>>>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.20-dt-bindings
>>>>
>>>> for you to fetch changes up to b2788f6320722d6059f849f35a77eb082608c627:
>>>>
>>>>   ASoC: dt-bindings: realtek,rt5640: Document port node (2026-01-17 01:58:18 +0100)
>>>>
>>>> Thanks,
>>>> Thierry
>>>>
>>>> ----------------------------------------------------------------
>>>> dt-bindings: Changes for v6.20-rc1
>>>>
>>>> This series updates various DT bindings for Tegra architecture,
>>>> primarily focusing on schema validation fixes and new feature
>>>> documentation for Tegra234 and Tegra264 SoCs. Key changes include
>>>> correcting realtek,rt5640 audio codec bindings (adding missing ports,
>>>> clocks, and jack-detect sources), converting Tegra20 NAND bindings to
>>>> YAML, and updating memory, DMA, and IOMMU definitions for Tegra264
>>>> (introducing CMDQV and DBB clock support). Additionally, it resolves
>>>> legacy warnings for Tegra30/132 display and VI interfaces.
>>>
>>> Same comment as was for Geert, I am surprised to see DT bindings as
>>> separate pull and I see drivers were alerady merged, so I will defer
>>> entire Tegra pull to Arnd.
>>
>> The soc tree used to have a separate branch for dt-bindings.
>> Hence several soc submaintainers still use that split for their PRs.
> 
> Yeah. I usually also only put things in the PR for ARM SoC that have no
> related driver changes (fixups, conversions, ...) and therefore nobody
> else feels responsible for picking up.

Why these are still separate? There are few options here:
1. These were needed by the drivers you sent in pull: should be in that
driver pull. It seems Geert confirmed this was the case with Renesas.
BTW, checkpatch asks for that somewhat - you will have checkpatch
warning of undocumented compatibles and you are not suppose to have such
warnings.

2. These were needed by the new DTS you sent in pull: should be in that
DTS pull.

3. These were not needed by anything yet or they document compatibles
already in the tree: that's the only case I imagine having them on
separate branch. You can take such bindings when subsystem maintainers
do not - they ignore them. 90% of bindings in this pull are not like that!

I will respond to that as well in separate email.

Best regards,
Krzysztof

