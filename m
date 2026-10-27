Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174BB606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 07:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rMJDPlrv;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eE+VbG0H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DUdFRfw52ywOMQpo+REv/lQY3o2e9igJbUGF/Xyek/s=; b=rMJDPlrvp32vZRL+qN7mgbgIKs
	4W0eNPpwYf0whjxwke8Lwp5HgCTH6FfMIbjqwDcPWGoLSX16LGtb2Kxj5KRy6DMWwj2EIKnyChuqg
	EKL96SVGn99tmfxOgTh3vS8UCECGe+pPCrPPRTlmQD4XQptbNC5boWsuPPYKFpxYx64xajYKakCkv
	+dQZw1fABccZmowEMVdb63QqDjv18gW3NVAPbWZkaRKzO3Y1CXj8TkboFKTjCtO+Dg8yTde5W7pwC
	iYc6ViBinxsPWzQGo5+/DVATL2dDQInaT246jnSpvDM4Kb3HCUTIk6d8cH4X3FXCJoDeHPoNymTLe
	ssEuwTAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLblB-00000003ugM-2H2Z;
	Tue, 27 Oct 2026 07:38:17 +0000
Received: from out-99.mta0.migadu.com ([2001:41d0:1004:224b::63] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLbl8-00000003ufX-3b2o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 07:38:16 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=DUdFRfw52ywOMQpo+REv/lQY3o2e9igJbUGF/Xyek/s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793086692; v=1; x=1793691492;
 b=eE+VbG0Hv0wSX1Dycv/q/bJ5Rc7/Ed4MlDcMXbmXhxZOMCAnMEx6WYh9L6U0oGUHdX8O9Kn9
 +DcLzMCLZNRNw0xk7ZRnBcuDk4spNKcn90jsmUqtGwkBQZFtlHG83Co/mgnh6UJAJuz7oxpuF/u
 wldmXmh4AXUKy6E7zduJ05ME=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d06f4027a94ad39e;
	Tue, 27 Oct 2026 07:38:12 +0000
X-Mizu-Trace-ID: d06f4027a94ad39e
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so6102e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 00:38:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzuL+ftnaRuui1dRrk+SQKJ8SXWLymu63NYGtbsHjWQz+G1z69K++LFBAUmLYRlvmoIIDJcpgdKsMuQzbyYDbt2@lists.infradead.org
X-Gm-Message-State: AFq9FYJMZEu9hPTJEDrqNB1hF4YEVI3OvoDTKbLW5C3aMAjE7tlATVRi
	8WamxSEkIa8Iq8J1myIewTY7OhxIcQ7pyx0k+Bd96YLqrOkiQPPV4sfV2pwj3F1HUd/OMU2TCpH
	NethrBgKtuoQ3HWdL+iGSwJSPJsVeMEwmftaaPzO3
X-Received: by 2002:a05:6512:31ce:b0:5bf:b994:6598 with SMTP id
 2adb3069b0e04-5bfc64ebb06mr117765e87.6.1793086687794; Tue, 27 Oct 2026
 00:38:07 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261026152639.3926498-1-fuad.tabba@linux.dev>
 <20261026152639.3926498-2-fuad.tabba@linux.dev> <at-mF3Qvq67Nh_v5@kernel.org>
 <87qzhc8ce6.wl-maz@kernel.org> <at_GYZQr1RIUi2Tf@kernel.org>
In-Reply-To: <at_GYZQr1RIUi2Tf@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 27 Oct 2026 07:37:31 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwnGzQ3ycmk+jL+Z8LKSZCBP9fy-CFvFWb18C6xb_xU1g@mail.gmail.com>
X-Gm-Features: AclHuK8QU5R1ACHMlkVCCkXbAIJslyt5dlAA4mZb-HbR610UB57AMm525lP1-_8
Message-ID: <CA+EHjTwnGzQ3ycmk+jL+Z8LKSZCBP9fy-CFvFWb18C6xb_xU1g@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: arm64: vgic-v4: Don't allocate vPEs for a GICv2 VM
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Eric Auger <eric.auger@redhat.com>, Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_003815_035715_780914DD 
X-CRM114-Status: GOOD (  14.19  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 26 Oct 2026 at 21:30, Oliver Upton <oupton@kernel.org> wrote:
>
> On Mon, Oct 26, 2026 at 07:55:45PM +0000, Marc Zyngier wrote:
> > On Mon, 26 Oct 2026 19:12:23 +0000,
> > Oliver Upton <oupton@kernel.org> wrote:
> > >
> > > On Mon, Oct 26, 2026 at 03:26:38PM +0000, Fuad Tabba wrote:
> > > > KVM can run a GICv2 VM on a GICv4.0 host whose CPU interface supports
> > > > legacy operation.
> > >
> > > I'm pretty sure there's no IP out there that has GICv4.0 and legacy
> > > mode...
> >
> > My favourite space heater, HiSi D05, says otherwise: 64 A72,
> > GICv4.0. Remember that it is the *CPU* that provides compat mode, and
> > not the GIC.
>
> Well I forgot that one got glued together. Good thing you're on the hook
> for fixes this round then ;)

Can I at least get one of those space heaters for my effort? It's that
time of year after all... :)

/fuad

