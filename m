Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6730FCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 21:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YzW1U44f4RW3heByRCcUya0EEGcxOJ3erFqxQWadsuQ=; b=sJBFEI/xGrMvk01MzpIEwRfMdJ
	csJp1ZUsaPHmX78Rg8lXbtMdMAujARjkRz7GSzDNa2j4BY1wI0u3nd5ntLc4DWK4u/xJXe/ArXJcd
	Sj/JgxglZeV10dUcmDvObzjmcA5rXTTu+qeQc1cKwA2reC+s4Vo8rPhpA5dzqVk8gWxxOXZF+5Nfh
	jgg7ao5wldJ8RAny3DzBw7FuV79CxK3PUXtT9r30Bj0jucqjZuEuLZmq0sSFtmepVnkKVpQWFIyD5
	awtwXsfy6qzvCpWM5wdlyAMGo3wx4ky8k5gqmnN7sFbngIiDNIs6NOzIeaQ+na9oZstQP2FV8Sky/
	GkwXEo6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSi9C-00000006OUw-3gzc;
	Thu, 28 May 2026 21:20:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSi9A-00000006OUV-2GgH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 21:20:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 84DBC43F74;
	Thu, 28 May 2026 21:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A6A1F000E9;
	Thu, 28 May 2026 21:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780003207;
	bh=YzW1U44f4RW3heByRCcUya0EEGcxOJ3erFqxQWadsuQ=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=Oc2kCTQESm74zGwZvvNrZz4xvjMMHqIYCcJEWdyLetGkA5Diw96uC0kHVrw3UWc/Y
	 Wl60mfx8OZxHsPJcN0+0258h5uroQ97X7tq1JPGGkoGJftIq//nY11npVccpw0/NsQ
	 lxazzzSM5oNQrBfKWWiJ3xV6FS+T52lvAt2A73JG6qIfH9G1FMuq0jkesQutp/oLim
	 VWpvZsw4ER14oLLPJVhVPc1wNmgJMZ6nJxJKiZLDCKVEAfDUdWkV6FusrK3BgLm9FL
	 shF791AQI9YqWP2wDWPLgK/7716dSIBzOGRmuLhkGr+u5PDyd5DqXHMfU9jtGrUfE1
	 QiCONx/WbO6NQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 May 2026 23:19:59 +0200
Message-Id: <DIUMH0XLMHCK.1V16LRBHYXG17@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 0/4] Enable sysfs module symlink for more built-in
 drivers
Cc: "James Clark" <james.clark@linaro.org>, "Alexander Shishkin"
 <alexander.shishkin@linux.intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
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
To: "Shashank Balaji" <shashank.mahadasyam@sony.com>, "Suzuki K Poulose"
 <suzuki.poulose@arm.com>
References: <20260427-acpi_mod_name-v4-0-22b42240c9bf@sony.com>
 <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
In-Reply-To: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_142008_605234_875D544A 
X-CRM114-Status: UNSURE (   5.01  )
X-CRM114-Notice: Please train this message.
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

On Mon May 18, 2026 at 12:19 PM CEST, Shashank Balaji wrote:

> Shashank Balaji (4):
>       soc/tegra: cbb: Move driver registration from pure_initcall to core=
_initcall
>       kernel: param: initialize module_kset in a pure_initcall
>       coresight: pass THIS_MODULE implicitly through a macro
>       driver core: platform: set mod_name in driver registration

I assume this goes through driver-core.

Suzuki, please let me know if that's fine with you for the coresight change=
.

Thanks,
Danilo

