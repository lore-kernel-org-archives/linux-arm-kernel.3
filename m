Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FECC71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 21:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7To7DaZM0GHRLHAlpFa5j2baxoS2wexgXsfmHFjVzPc=; b=dDJCOjuUCHY7nCuRiU3rIkagII
	vN/eruMwluOLRsaMD8zCCNaX664Fk3bdan80Gg2KHASY1zMUa1+ixlKhlermoae2c7EfdCM/wXnDw
	CBjS6Y45DPsnWTda55dUsFkOE6wanl9Et3GV5u3YmKFg58ImVGt7n62OhVhIcPPZ1pcLbOsdzc4Ko
	e9J+xybQmuOi8Wb766XZetai+GmqulunCJy87xjdVAqHWg2+fN1yQU8t2G2wKwV55xjxCOJBOFyrF
	yL7QXBDKeh/KHJ/0tta+7tGSEpiGHqMpjESH/SDPnPpC6U41zqt+9vsUzNEasimkg8lWXEzrOlGQc
	NePVDJ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPT52-0000000BLNe-16sR;
	Wed, 11 Jun 2025 21:33:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPQxZ-0000000AwvG-45XX
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 19:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7To7DaZM0GHRLHAlpFa5j2baxoS2wexgXsfmHFjVzPc=; b=Ox7xI/jMdum+XlC6DLOJPcxsa8
	NPWiAJCmVSOMGv49fHY/yNLNxZOqLSAAIVhDqOSRgUy6Br38F4La/hlpJwQm35QpnU8W/lWl7FH+n
	PvrSvthJLNuqEBUVNko45wEKOQUywXsHUUrzmtmQCp51VZ3X0CRdQ7MiCBqKP1Qv6JnlI+YrvzegN
	qOimbEvt8SNCYw7k0n8qzs1DZyVorcHq495Mss98lSqsjPYKwETC1+ElYtsyBN/eoA85WfJKTr8R5
	bWbhl6+PBKlSB/j7wK183RUkQVUye/CCC3d/3+AGJNXycrPJbJp51UnztrbRA2rhEfiZRBWL4rmbC
	agcR5O5g==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPQxX-00000002UUs-2GOS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 19:18:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5D43AA51A01;
	Wed, 11 Jun 2025 19:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5CAC4CEE3;
	Wed, 11 Jun 2025 19:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749669479;
	bh=ixMFPUH8G0la89VryFZZwZQQgubi9L+Tr/reP0V53i0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V6+jHSbZf2qJ30VWwYEhPQo4xh+oakbO97KWLTzBkqRVFPOKjTpT38tDFJlzgHQUv
	 i5SWQYgEUAiJIJ6+BmgDC+MJMfg+M8LidmiLu+nFmInp0g6ow8ABMzU3dNTxv9WU1w
	 MW+0uMLguy7QsEfubvvKffhSsvz7oB7Hdk+fD+5U4VMhZ4c4NL4iG0f7CA7MqEsUKl
	 I0UEshpoJCQS4NR/TCJif62mQ27Jz7zn6sOId0Rmrq17MuexRS2bdeQ9xuhGlDTfJX
	 5jXr/R/bOf8Zl6i6dm6OXweRyrEvDLYkYzSCfDu4nIurrck+hT37gEcq4P+zAlGsa7
	 +rFDXUr2fu9cA==
Message-ID: <5b6a642d-b9c6-4648-b1ab-1823bbcb7ea2@kernel.org>
Date: Wed, 11 Jun 2025 21:17:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: Add Apple SoC GPU
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: asahi@lists.linux.dev,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Neal Gompa <neal@gompa.dev>, Maxime Ripard <mripard@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
 <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
 <edf14a64-decc-4392-a038-08b5dd942f8d@kernel.org>
 <CAMT+MTRYybR=tFJrcUn43UK3iW-fqEH3rmCLUezq2eTrEK=nQw@mail.gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <CAMT+MTRYybR=tFJrcUn43UK3iW-fqEH3rmCLUezq2eTrEK=nQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_201803_790246_1BC21AEB 
X-CRM114-Status: GOOD (  13.63  )
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

On 11.06.25 21:06, Sasha Finkelstein wrote:
> On Wed, 11 Jun 2025 at 20:44, Sven Peter <sven@kernel.org> wrote:
>>> +      - description: Driver-opaque calibration blob
>>> +      - description: Calibration blob
>>
>> Like Alyssa mentioned, this description also raises more questions than
>> it answers for me. Do we know what these two blobs contain or why they
>> are two separate blobs?
> 
> At some point in the gpu initialization process we give the firmware a bag
> of pointers to various stuff it needs. HwCalA and HwCalB are separate
> pointers, and they use separate gpu allocations. We do not fully know
> what is in there, but we know what some of the fields do and how to
> create the blobs based on data from apple device tree.

I looked at the driver itself and there are two comments related to
these:

HwDataA: This mostly contains power-related configuration.
HwDataB: This mostly contains GPU-related configuration.

Are they still accurate our just outdated leftovers from an early
version? If they're accurate I'd include them in the description here as
well.


Best,


Sven

