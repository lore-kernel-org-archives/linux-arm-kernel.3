Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90C4CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 10:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDtuzX8GSRdNnzA0j3vYCo53D2gEkMAMB3J+4cGnO3A=; b=uGBs0i3XdYwcRTfD2jlnkjbDsI
	y3www5lGmTTh1R+OS2AJa1Xd5ahabek0Sh2+6C1V0gqPfkTCcTcXR8B6fEWiMBcm2+zDkbaG3EN8u
	hymceikpl9UPuHJ+1x8vySfeRpQt2kZHrl+3sFZEkUPn6su9/bTcKk7RPjx92x6PwXiJwj7RklP41
	6miwV/AUNiqlF5en+UKDVYlX4WjeGaVYDgynHVdi+ieO6qmg/51lIYFst4ELTX6/30WKtKV/DDHNV
	6ppw9VIT9m1I98/riARYw0yKfzoMdOI6dbEDR0In0Os9vwifblYnHu3TXvbTxwCk3pPGuTBPrWEiR
	mSJFO/Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvCh-0000000FDeA-0aee;
	Mon, 18 May 2026 10:28:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvCg-0000000FDdZ-1dAF
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 10:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TDtuzX8GSRdNnzA0j3vYCo53D2gEkMAMB3J+4cGnO3A=; b=FDkZ/sToE15BKNsCVAf4RQi7Ti
	P6Yq1zr6D55sA9GZr4y2tkGe3ODQwp+peWz3bxci0+q0ZY924PGZsNRp+077bSnZ6VjnwcdEV3r9i
	liVHcy0YVj9FAdKB23kTVSv+RStGl0h8OvQhwNFBrjJohwfgAhpV7g26TVLv5NGF6cEC8nwx3E44W
	wDG9PZl2ey+Ziq28HRnDdwnY87xAO9t0D+a+ps7gxls3Vi287q13nrdI6sK+co7ioDGYeMgzTX8mz
	ekQ1H8/3SuOPJHnxDPsL0gdvEo7IFgx61jzs0Xpe38S82YNB+W2sAfQ8PVNqdg3FbmqGXKAEtpjey
	vytE+u7Q==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvCb-0000000Al8N-2dGY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 10:28:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D64964070E;
	Mon, 18 May 2026 10:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B823CC2BD00;
	Mon, 18 May 2026 10:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1779100079;
	bh=YLOEOYqUNAQEFO1TexjQZE85HRrFgr8e3AuK7+W2Ze0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w3u6WSpTP7/fvpaD9J1vxQsgPtGOq9pwBQ4hOSpDu7mD3Epg+4S2oOfqHu5BAfz/F
	 npl9YyI8s4EW1teGk3jRiZFSgfO2GGQ4nLaa57Y3PCHfRU2dVIhzdc9ILBVf7bEvT6
	 dElLkIS98P0GYrTqMhex6X2E7csM9pIRdMkUv8ao=
Date: Mon, 18 May 2026 12:27:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>, Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rahul Bukte <rahul.bukte@sony.com>, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>, linux-modules@vger.kernel.org,
	linux-tegra@vger.kernel.org, Sumit Gupta <sumitg@nvidia.com>
Subject: Re: [PATCH v5 4/4] driver core: platform: set mod_name in driver
 registration
Message-ID: <2026051827-curler-disjoin-c83f@gregkh>
References: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
 <20260518-acpi_mod_name-v5-4-705ccc430885@sony.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-acpi_mod_name-v5-4-705ccc430885@sony.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_112802_451809_788850AC 
X-CRM114-Status: GOOD (  19.46  )
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

On Mon, May 18, 2026 at 07:20:00PM +0900, Shashank Balaji wrote:
> Pass KBUILD_MODNAME through the driver registration macro so that
> the driver core can create the module symlink in sysfs for built-in
> drivers, and fixup all callers.
> 
> The Rust platform adapter is updated to pass the module name through to the new
> parameter.
> 
> Tested on qemu with:
> - x86 defconfig + CONFIG_RUST
> - arm64 defconfig + CONFIG_RUST + CONFIG_CORESIGHT stuff
> 
> Examples after this patch:
> 
>     /sys/bus/platform/drivers/...
>         coresight-itnoc/module		-> coresight_tnoc
>         coresight-static-tpdm/module	-> coresight_tpdm
>         coresight-catu-platform/module	-> coresight_catu
>         serial8250/module		-> 8250
>         acpi-ged/module			-> acpi
>         vmclock/module			-> ptp_vmclock
> 
> Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> ---
> This patch depends on patches 1, 2, 3
> ---
>  Documentation/driver-api/driver-model/platform.rst |  3 ++-
>  drivers/base/platform.c                            | 21 ++++++++++++++-------
>  drivers/hwtracing/coresight/coresight-core.c       |  5 +++--
>  include/linux/coresight.h                          |  5 +++--
>  include/linux/platform_device.h                    | 17 +++++++++--------
>  rust/kernel/platform.rs                            |  4 +++-
>  6 files changed, 34 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/driver-api/driver-model/platform.rst b/Documentation/driver-api/driver-model/platform.rst
> index cf5ff48d3115..9673470bded2 100644
> --- a/Documentation/driver-api/driver-model/platform.rst
> +++ b/Documentation/driver-api/driver-model/platform.rst
> @@ -70,7 +70,8 @@ Kernel modules can be composed of several platform drivers. The platform core
>  provides helpers to register and unregister an array of drivers::
>  
>  	int __platform_register_drivers(struct platform_driver * const *drivers,
> -				      unsigned int count, struct module *owner);
> +				      unsigned int count, struct module *owner,
> +				      const char *mod_name);

Why can't you just use the owner->name value instead?  They are always
the same here, right?

thanks,

greg k-h

