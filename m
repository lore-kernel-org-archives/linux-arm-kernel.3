Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903ABC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 02:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tTZsmkYT/a9BxcohzDJff4R3wzv7sxwmzzZDumSmYU4=; b=DBz4lvVOCD4oY18dv5Z/3XRg2m
	pP6lmRNTimXrU7N3VTITkIbvAGVqEmU4rSvhGPZiBL8SyufTmZJZY8597mDkolgf4YTKFHOncxw1/
	vaS8O+h75KsLUTBrAFSiN69MJScPeDvZFMO+W+RQg/fsCvH/vUK1rlwnr76A/+nBXHVy1GSVNG0Pe
	mzBRTIWcQMvjgqxyLA9pD/E+fUjMZJHUoW8Jq4d2MV6sXjjxrYshPO3/lTUzSzwRD7hStof8qm+CY
	vdypSberI1MXYaQY4w8rOXra9p7Fi0F/5R6/RLM9PxlyRwDKQyO8t1AWPYADP+kzk5Mnux381k1mL
	Hm+KBEaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEfPU-0000000B9xV-1hO8;
	Tue, 13 May 2025 02:30:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEfNM-0000000B9o2-1FIO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 02:28:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 49D98449D2;
	Tue, 13 May 2025 02:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66D7C4CEE7;
	Tue, 13 May 2025 02:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747103291;
	bh=D7xptc1R3SsJFK6sKlRnaBVgiDudW1HvUViVifIPIks=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ga6m+ZwoTs3IXx7Rbp379330O8kywtaWWr7XQtHupSk0ClLfjsmm1EDcnslV2oqd3
	 ssR+K6zUXnpDrt80wlJqjj6yBjqdMVrbhTxe0uZ2Llt4rw6e8mPRFFxYtzDsVg4Iy4
	 3ftzfOhxQKkHePhc2+4v9t6/Qs6HVIP9CxMVTjxeFZluDmT8ynbslbYxCNqCHqxh01
	 +7xuV9vOt1oaSP5SbA97RPKLGLN4IkRPyDPrCri55SQainbK8/PQHR5jbXYKyo9KlL
	 O/tCZ8xG2W7uBgX2eHc7uLaNRhlmtdQjv3D3PRhrQqD9qUE9PCz8MvhpDk227c71QH
	 MOnEJlARoIbwg==
Message-ID: <d3615e4f-4107-4f76-9e8d-c19fcf43c816@kernel.org>
Date: Mon, 12 May 2025 21:28:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] ARM: socfpga: updates for v6.16
To: Arnd Bergmann <arnd@arndb.de>, arm <arm@kernel.org>, soc@kernel.org
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250506004825.134929-1-dinguyen@kernel.org>
 <b8257b35-04b7-400b-bc58-948dd5fdf799@app.fastmail.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <b8257b35-04b7-400b-bc58-948dd5fdf799@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_192812_362990_AA5EEA4A 
X-CRM114-Status: GOOD (  21.44  )
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

On 5/10/25 15:18, Arnd Bergmann wrote:
> On Tue, May 6, 2025, at 02:48, Dinh Nguyen wrote:
>> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
>>
>>    Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>>
>> are available in the Git repository at:
>>
>>    git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git
>> tags/socfpga_dts_updates_for_v6.16
>>
>> for you to fetch changes up to 8dbffe5f5dd531a3c3f9d603462e499085449277:
>>
>>    dt-bindings: clock: socfpga: convert to yaml (2025-05-03 13:33:23 -0500)
>>
>> ----------------------------------------------------------------
>> SoCFPGA DTS updates for v6.16
>> - Updates to dt-bindings
>> 	- Document Agilex5 NAND daughter board
>> 	- Convert Stratix10 FPGA Manager to json-schema
>> 	- Convert Stratix10 Service Layer to json-schema
>> 	- Add document for Terasic's DE10-nano board
>> - Add support for Agilex5 NAND daughter board
>> - Add basic support for Terasic's DE10-nano board
> 
> Hi Dinh,
> 
> I'm not sure exactly what happened, but I see that this is
> almost the same as the previous pull request that you had sent
> for 6.15 in late march.
> 
> I had already pulled in the previous version, and if I pull
> this one now it would result in duplicate commits. Would
> it work for you if I just cherry-pick the "dt-bindings:
> clock: socfpga: convert to yaml" patch on top, to avoid
> rebasing everything else?

I apologize, I just assumed that since I missed the 6.15 window, that it 
would gone and I'd rebase for v6.16. They are the same patches. I'll 
remember that next time. Yes, just the "dt-bindings: clock: socfpga: 
convert to yaml" patch would be fine.

> 
> Note: the list address has changed again, so please send
> future pull requests to soc@lists.linux.dev, cc:linux-arm-kernel.
> The arm@kernel.org and soc@kernel.org aliases still work
> for the moment, but the real address is the @lists.linux.dev
> one.
> 

Noted.

Thanks,
Dinh



