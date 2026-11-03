Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA75C606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=haB2RF6y;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ch09Q+nd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NBtYdfJ9FACFqGH8pymCzLh+8VMN+8KU9nb8NqUMw3U=; b=haB2RF6yHBLZy+E0PJH8InE4Ay
	/Ixk+Wm0CKt694qgUbHfG1T6mgGmr8d2fG+AFCk9hrvV6MoD0hsSrfabiNHbrOx5e9FY1NwKebouL
	V1Y8TQlKrhMFGI29+rxal+yeNj8nsX0asEPJgsaaKwVXeO55QDn5/OXg/yV24W9Zt1dIGdKtvtqVh
	sgDB+tqAP/mPdjI7l3nsYjU2A5dJY0DdWG8MhfQE0tvcUu6BfDTb4S7Hxc+t0oR113sWESKNOCtkU
	tFeBTqMYSkLbXgQttRdR9yfOjlU/HflWSCUa9rP5b0iIGSWF2QV8p0aoGVRF4O8pyAcIUrpp0x0c8
	Tfceiw+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODB7-00000002Igd-0Ki7;
	Tue, 03 Nov 2026 11:59:49 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODB4-00000002IgD-2FQk;
	Tue, 03 Nov 2026 11:59:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793707187; x=1825243187;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ve/7VngWp5nu6ma8xxZ/WNVYXekDw3Wkhfvgu/iaSog=;
  b=Ch09Q+ndunaztv7p4ciznCZudjl7Z1MvcTuJ6eZDBnYTUsadkb2xUF3l
   owI/BC+vN/C4VC0Okbqp2E3X9gJs7K0mGs4RbPe0QwnZrvbPjoJy5GaI7
   8v7WFH02Z/+cL5N8QUSa/ZzS4uXEM1FwTyJfscK3pBbqpbYypCIdjZWIY
   NoIENPnwwjTp4pfMJd+yjvAHDhepprJjOQzjtQiQq7ErEXbdJUOYGJpZ6
   hZIVAGbuDOZsHBMMPvpg5EauEqT4PHvYHxNdM/GaaYMam9oqQGhVbgSHo
   6P8t+UHbzYqHfyIES2octGsIZ5JkAZwIKSJVqJSk044JN6evmBuEjZ2E0
   g==;
X-CSE-ConnectionGUID: 0HXchJfrRBG9T9QKXZBbTw==
X-CSE-MsgGUID: sakZiiX/T3qaCO+2tp6Fdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2437483"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2437483"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:59:46 -0800
X-CSE-ConnectionGUID: iNmx9fryS6+inCdn210jIw==
X-CSE-MsgGUID: bZp7h2NoSpe3HSWvbAyx4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="8253818"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa013.fm.intel.com with ESMTP; 03 Nov 2026 03:59:43 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 6388099; Tue, 03 Nov 2026 12:59:42 +0100 (CET)
Date: Tue, 3 Nov 2026 12:59:42 +0100
From: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
To: Chunfeng Yun =?utf-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"westeri@kernel.org" <westeri@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 2/4] thunderbolt: add support optional dedicated wakeup
 irq
Message-ID: <20261103115942.GZ158991@black.igk.intel.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
 <20261030082539.1208733-3-chunfeng.yun@mediatek.com>
 <20261030084854.GQ158991@black.igk.intel.com>
 <34de87bb4da20626d440346f9aa0cf7873ef85d1.camel@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34de87bb4da20626d440346f9aa0cf7873ef85d1.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_035946_625689_E0AD5478 
X-CRM114-Status: GOOD (  18.12  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Tue, Nov 03, 2026 at 09:05:45AM +0000, Chunfeng Yun (云春峰) wrote:
> On Fri, 2026-10-30 at 09:48 +0100, Mika Westerberg wrote:
> > On Fri, Oct 30, 2026 at 04:25:37PM +0800, Chunfeng Yun wrote:
> > > There is a dedicated wakeup irq on nvidia n1/n2 SoCs.
> > 
> > Okay but why it is needed?
> due to mac/phy is in power domain which its power/clock will be turn
> off when enter into sleep mode, so can not use the mac's irq to trigger
> wakeup signal, instead add a dedicated irq to send wake signal which
> stay in always-on power domain.
>
> >  Can you add this to the commit message?
> OK, will add more info
> 
> > 
> > And why you did not add it already in the first commit that added the
> > platform driver there anyway?
> OK.
> because I test base funtion first, then support suspend/resume

It's fine to test it how you like but split the patches logically when you
submit upstream, and this one belongs to the first patch IMHO.

