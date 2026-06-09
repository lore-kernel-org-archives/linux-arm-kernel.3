Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329D7CD8CAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 10:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tta0PE+TZa8mL2th0Lo4FOkqR6QU33gR5Ohh0rNcY3c=; b=ul1pWh1ecHAMY2G2C2X61wnUgN
	i6QpEU0P1gOJ7AUQ8WtS7PZL7xQIGXsouAJerzamezQ+dqGEObEFsst8romX7V1XrddnqEWrLVlPa
	i77Hl+S8aUknDQF3BZEqwZGpmkYHJTGMVRiQJVh/6EBnMURMtTCxYapXHgUhei9qMBrHldz+zYdYY
	He2DkO2YBICdHwehhneufTXIcG9RxsQsLXcIsgtQUk6erovSdSVTC+wWRrJOhlbwKFbqSDuRKLokw
	ox4B4RJ4+Qj0Y7UQ9L5NuO2LcyubmCqXvzzdSMYHeg8LSEB4jnONoccq2HOqDAAEVunSrYnRE60xc
	qvl8lzbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWthp-00000005MD3-3QjH;
	Tue, 09 Jun 2026 10:29:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWthn-00000005MCe-3Pkn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 10:29:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 02397601DC;
	Tue,  9 Jun 2026 10:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD1D1F00893;
	Tue,  9 Jun 2026 10:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781000950;
	bh=Tta0PE+TZa8mL2th0Lo4FOkqR6QU33gR5Ohh0rNcY3c=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=ReKNvMcDkiw28GD3JbvCn9EipMm3IlPfdSUWfJXpK9M22Lgm/K3GFU1SXdrhkXZEB
	 5SdM69gC2r+NC3WYCbCyPuR0cxz1XkIOUgt6duIDMczoeCJR/yUOxNMDc0ndy4j1bL
	 fhLRu560UpjLJ6CgASjX+dnsScqp81YH+hH9fCPxrUrbK58RdWMsNFEr7vDg5pBwVs
	 35L1XnVoIyEwFAMW+axHlLAzHFwSMNxKWj5/H++TRdC8TACW8rcVaZM5dRKOPOwprT
	 tAGhAihwORzRGf1hQKmxKcgbu/f1FfpH3ai4lC8Wc3KCMX/XVXkAO378gK1Np1FfBm
	 cwCv4PY4W2rgg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 12:29:02 +0200
Message-Id: <DJ4G55S28THG.21SSZK5PQQVGL@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 0/4] Enable sysfs module symlink for more built-in
 drivers
Cc: "Shashank Balaji" <shashank.mahadasyam@sony.com>, "James Clark"
 <james.clark@linaro.org>, "Alexander Shishkin"
 <alexander.shishkin@linux.intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Petr Pavlu" <petr.pavlu@suse.com>, "Daniel Gomez"
 <da.gomez@kernel.org>, "Sami Tolvanen" <samitolvanen@google.com>, "Aaron
 Tomlin" <atomlin@atomlin.com>, "Mike Leach" <mike.leach@arm.com>, "Leo Yan"
 <leo.yan@arm.com>, "Thierry Reding" <thierry.reding@kernel.org>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, "Rahul Bukte" <rahul.bukte@sony.com>,
 <linux-kernel@vger.kernel.org>, <coresight@lists.linaro.org>,
 <linux-arm-kernel@lists.infradead.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Daniel
 Palmer" <daniel.palmer@sony.com>, "Tim Bird" <tim.bird@sony.com>,
 <linux-modules@vger.kernel.org>, <linux-tegra@vger.kernel.org>, "Sumit
 Gupta" <sumitg@nvidia.com>
To: "Suzuki K Poulose" <suzuki.poulose@arm.com>
References: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
 <20260608222448.1353773-1-dakr@kernel.org>
 <1c8e441a-6b33-465a-88f9-9552f346ae18@arm.com>
In-Reply-To: <1c8e441a-6b33-465a-88f9-9552f346ae18@arm.com>
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

On Tue Jun 9, 2026 at 11:08 AM CEST, Suzuki K Poulose wrote:
> On 08/06/2026 23:24, Danilo Krummrich wrote:
>> On Mon, 18 May 2026 19:19:56 +0900, Shashank Balaji wrote:
>>> [PATCH v5 0/4] Enable sysfs module symlink for more built-in drivers
>>=20
>> Applied, thanks!
>>=20
>>    Branch: driver-core-testing
>>    Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/dri=
ver-core.git
>>=20
>> [1/4] soc/tegra: cbb: Move driver registration from pure_initcall to cor=
e_initcall
>>        commit: cd6e95e7ab29
>> [2/4] kernel: param: initialize module_kset in a pure_initcall
>>        commit: c82dfce47833
>> [3/4] coresight: pass THIS_MODULE implicitly through a macro
>>        commit: efc22b3f89a3
>> [4/4] driver core: platform: set mod_name in driver registration
>>        commit: a7a7dc5c46a0
>>=20
>> The patches will appear in the next linux-next integration (typically wi=
thin 24
>> hours on weekdays).
>>=20
>> The patches are in the driver-core-testing branch and will be promoted t=
o
>> driver-core-next after validation.
>
> Apologies, I missed your emails. I am fine with those, happy to fixup=20
> anything if the linux-next screams.

Thanks for confirming! I did a test merge with linux-next and an allmodconf=
ig
arm64 build before picking it up, so it should be fine.

Thanks,
Danilo

