Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97195606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 12:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LZGVf8+1;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DQiZ14JE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T8Eng3qwLEeUoVGvRshX3rc6PfkWjqVrwxy3a8uah8E=; b=LZGVf8+1o/zLN8aSxLWMGHiFo+
	k6QuuDLM4eWZ2Balniq6kiz9Eh5ky36oQZzl4QRq4nrjmx512fg4AOYTKC+4Qbr+KHyHb1fE16hfc
	84Xz9bkjx1DW4kjQQtg7zhb9oxCGNUCOx/FmR+/heZS7FiOfXSsv5JzUAQpFYz39Pnagc4nyBtnh8
	6+mP9clrM2QJm4f3GD399wGzfJgspzSL99f6baTlpoSMhxEa4P0f3KwBfKTtXJPJjMPqjkoy4TkOn
	bSsjjhE2yDXs93ethP1bAKLkdK7epEU8/raq8fxPJWQI2ROnzmRl0G22lHsHvvuBsr2ytkvR207ye
	2Vgws35w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOqK-000000096kF-3pa0;
	Thu, 29 Oct 2026 12:02:52 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOqH-000000096jb-1HPq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 12:02:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793275369; x=1824811369;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Jr2MXl655ILtgT8HMWCdbmGSBcxTaDURabb84rT89Ow=;
  b=DQiZ14JEYjWxaFsvFuS0tb1dem3EJvRqTFcTH0FFegZ3sfGa3ZsXuJiC
   m7Exbr9qwnoy/79JifrvImU+zEwmD35815Az5gni1T7Hryp39VSCYdA6S
   bRnTxL20w2WoIivr7+eruC3Bpd53PN8+7QSD9WFaAypP/QYB5Gwm82hSt
   Fr+H44Ui1oH0QjGQW9B0uPTNdquUUgbvPedv26i5WMnH29XxGDM3D/qGz
   tiQLklni6O8yqdyjORe9/ez3zpMK/HOA8xA+EcgqWHtFW3r0CpG97xY+P
   e8RBO+ckq6dM+ulHynJbq8rcErElE1tCVotSKUkrG6MCDfMx34zMw1Vno
   w==;
X-CSE-ConnectionGUID: 4tRDQH/zQHSRKdY0IxpfQA==
X-CSE-MsgGUID: AV7unkz0Qg+pMs7Oq66EBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1892992"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1892992"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 05:02:47 -0700
X-CSE-ConnectionGUID: ifwCoafmRViVOiPhHZbVrg==
X-CSE-MsgGUID: ZIdt35McRE6q3dwbWX6XdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5261488"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.149])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 05:02:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 29 Oct 2026 14:02:31 +0200 (EET)
To: Yin Li <yin.li@oss.qualcomm.com>
cc: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>, 
    Shanker Donthineni <sdonthineni@nvidia.com>, 
    Ben Horgan <ben.horgan@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, 
    Catalin Marinas <catalin.marinas@arm.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    "Rafael J. Wysocki" <rafael@kernel.org>, 
    Danilo Krummrich <dakr@kernel.org>, 
    Reinette Chatre <reinette.chatre@intel.com>, 
    Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>, 
    Bjorn Andersson <andersson@kernel.org>, 
    Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>, 
    Andre Przywara <andre.przywara@arm.com>, Drew Fustini <fustini@kernel.org>, 
    Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, trilok.soni@oss.qualcomm.com, 
    aiqun.yu@oss.qualcomm.com, ganapatrao.kulkarni@oss.qualcomm.com, 
    Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>, 
    Huang Yiwei <huang.yiwei@oss.qualcomm.com>, 
    linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, driver-core@lists.linux.dev, 
    devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 2/6] arm_mpam: Fix MSC MMIO window size off-by-one
 with resource_size()
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-2-bdda1e445cba@oss.qualcomm.com>
Message-ID: <629fcaca-66ad-bcc6-fbe2-bd80e9822c94@linux.intel.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com> <20261028-mpam-resctrl-dt-knp-support-v4-2-bdda1e445cba@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-96330462-1793275351=:1322"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_050249_438465_7E196013 
X-CRM114-Status: GOOD (  18.92  )
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-96330462-1793275351=:1322
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 28 Oct 2026, Yin Li wrote:

> struct resource uses an inclusive end address, so the window size is
> end - start + 1. do_mpam_msc_drv_probe() computed it as end - start,
> which is one byte too small.
>=20
> mapped_hwpage_sz is used by the register access bounds checks, which
> have the form "offset + width > mapped_hwpage_sz". With the size one
> byte too small, an access to the last register in the window is
> incorrectly flagged as out of bounds: for a 0x1000 window, a 4-byte
> access at offset 0xFFC (bytes 0xFFC..0xFFF, legal) computes
> 0xFFC + 4 =3D 0x1000 > 0xFFF and falsely warns.
>=20
> Use resource_size() so the size is correct. The ">" bounds checks are
> correct as-is once the size is accurate and are left unchanged.
>=20
> Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver and =
kbuild boiler plate")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3-lkp@i=
ntel.com/
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> ---
>  drivers/resctrl/mpam_devices.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_device=
s.c
> index 347a5a6d6a1d..0f984fcbcae9 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2508,7 +2508,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struc=
t platform_device *pdev)
>  =09=09=09dev_err_once(dev, "Failed to map MSC base address\n");
>  =09=09=09return ERR_CAST(io);
>  =09=09}
> -=09=09msc->mapped_hwpage_sz =3D msc_res->end - msc_res->start;
> +=09=09msc->mapped_hwpage_sz =3D resource_size(msc_res);
>  =09=09msc->mapped_hwpage =3D io;
>  =09} else if (msc->iface =3D=3D MPAM_IFACE_PCC) {
>  =09=09u32 mpam_fb_msc_id;

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-96330462-1793275351=:1322--

