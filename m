Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B706CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 22:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3x5kdRepi1J7M2cEklCCm2sZSMg7DeC+hQ4uJgl+jo=; b=My6tn6ninn4bEUF7Je6YsrXCBN
	w5yeGkYDFEjw+Qjyn9i5GWjyssUsQpHWILto0xr7Nj+RuwsbCaZh7wrx2ZRw1D/A65020CgjD3zgx
	iTYRVNYzmId+tc5aqoIwVRb3oKeqTRZ10DYh8vB/A6Pn8G/oMeVPNKx8aziwB9dw4/KByhzO0cUQn
	0aRmkPwKNGMGljXAS/yGGm21NdJtVHdrI6pcSl2/wA6MmyNsX08fLgDA7JDd+fHpSXITTEPbAq11c
	mBjixjPC2xw/RP5EcoKo6GsTECvLgyCwxa2dDCumAQTUJGKu5Ma2yqrgzfLS91WnaBa/GSb84dD2/
	rmKPgZKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWiGf-00000004TxF-0H2Z;
	Mon, 08 Jun 2026 22:16:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWiGe-00000004Tx9-2TGR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 22:16:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BD17C6001D;
	Mon,  8 Jun 2026 22:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B047A1F00893;
	Mon,  8 Jun 2026 22:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780956983;
	bh=s3x5kdRepi1J7M2cEklCCm2sZSMg7DeC+hQ4uJgl+jo=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=ZLbqrydL7uyVtFWzj+G/HXsf6Sz2tjT7ZGEGgMUDd6H07Gcz5KOZ0rkOR9SUuGpMf
	 KUH0jpIikh9r5wEV+cMU2AtHmfmjXOkNUrhQG3lbI78brINcYV+RX5lunaFFgeMdzA
	 2f0TIi3VeS4lHUxE1kpeVtdA2KXX4BC7HemIGdtTPAdoT684mUe4/ET1KCVAd039Ax
	 9wAn/nDnK/rWEiXfQwgez5TprRHKpTADfNPsp7hqbGS9T8wM2PEtiUW3e4z2oJD80u
	 0VERCKS2tDxSPFMfAekh/YB0Hw4UmBvQjDKdpcIiRrVofwwiRND1Z+iTkhkTN9VPeB
	 OlYVhEWVBecvw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 00:16:15 +0200
Message-Id: <DJ40K3IBQUBY.EAMZAFC3091I@kernel.org>
Subject: Re: [PATCH v5 0/4] Enable sysfs module symlink for more built-in
 drivers
Cc: "Suzuki K Poulose" <suzuki.poulose@arm.com>, "James Clark"
 <james.clark@linaro.org>, "Alexander Shishkin"
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
To: "Shashank Balaji" <shashank.mahadasyam@sony.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260427-acpi_mod_name-v4-0-22b42240c9bf@sony.com>
 <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
In-Reply-To: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
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

Picking this up now, so it can still make it for 7.2-rc1 and get some time =
in
linux-next.

Suzuki, since I haven't heard back I figured it should be fine to also pick=
 the
coresight change as it is purely mechanic and driver-core motivated, but pl=
ease
let me know if you have any concerns.

Thanks,
Danilo

