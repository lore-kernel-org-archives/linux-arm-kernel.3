Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5A3606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 17:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kAH/cv+e;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=YpNS5zPT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/9Q6vwSpHzLOuQcu+iZE9ek6ulZ0fAfcC9lHWm1vuA=; b=kAH/cv+es0i8/KwRJ9jdNex1gH
	/1ZE/Ok8uF2PbAMyPqcs6jFlQi3E4S+sWuMkVb7mKKo5PqUwXGD8fKH2Yllwa/tiWB0SLvWbMjsNF
	I7yQ5H2qKQqofLgyLsjj744z7pR3N1z/ZETj/xz48GjKi05vgfmh2NAG5zCR6pT+gaz4akzaPipeN
	SSfqXo4OQ0xb85MTuZ52rvIQjcJMD7oelzmy8iEUlWbjCxHLPb8T/KDEgih4EaK/1q5fYBLtr1qBh
	+vQvAx91bTDamhvO9fnoyg44aBQfCtz863CiNK31LpXz0VBGHG9Zx5B1VqSFiZ8Ox6i4bUv+vD7DD
	Y/26bJKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJaYD-0000000CbZV-34rA;
	Wed, 21 Oct 2026 17:56:33 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJaYB-0000000CbYa-1pxy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 17:56:32 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6b413b0a974so840643a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 10:56:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792605389; cv=none;
        d=google.com; s=arc-20260327;
        b=jut7Ia1HdopmUIkO47MDReujwX1b21M0+ib7e9iGxa2+Dj2P606Z0Xb7uc0rzdvtfr
         Iy+zrUo2Bd2C/+iRxXu4AUMRKZMTa0zTAtXa/It1UOxu5uVfnoKT7t5oBj3avMkzt+NP
         zI8ocAmJiqLDMDNBDXQpp8jpPCeXw2Al5o8Ua668lupt4Kmmtlm8K9EWtZIViPDyGRnt
         A0odUbcogLQfIzfXpevWjRkEzRZJzzfzr4+i1WFqj/WSwqlC4M8TH1ZjQoQc0isEGSMR
         JCFGs4/q8GOof0m8clAOZCkepFPJ0ZmPlLaxx+k2e1HqRlWwtvrZeb7KElfQ+so8m7My
         TgBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l/9Q6vwSpHzLOuQcu+iZE9ek6ulZ0fAfcC9lHWm1vuA=;
        fh=1oAuccQM1o7wbmMbsyUUri1a+RCoF2kALYS/wqYTO6w=;
        b=reMO0L127BkAs+0vE8R5GFqpbEpSMDLSU9yk6xmUVeSJZmCzxB9wroP9Cx5/gXfti6
         YBv7rcXgrDdIcgGmGOvUuRAWyZkzc9vaGgsVbCAs0x/3GTDPH/uV3KPqmbJmivQPGhKB
         WdRQF70KE7Dn1o0UjCoUxY/wB1VPNI9NT3ejvSpveakaPkdGPZCXwrPEw9fKGMRW0s3s
         GTwXW3mh+umFzf9uJqjmqc1hm44r4VJhysa+bUsjL4KvIjR5B1tKo5+yQrGpw2oa0aar
         iSuQtW1U8NyJKtNlmHDCpTdr+/GnVlUB/MsR83UReTz9Alj5EyiRxzwgnKepDHS5scIa
         Avjg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792605389; x=1793210189; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l/9Q6vwSpHzLOuQcu+iZE9ek6ulZ0fAfcC9lHWm1vuA=;
        b=YpNS5zPTJ/EMYTFzU9vB9PpK+S7cGGywioTA3ToQXyFLnoB2YYdHgWFsmgxIJKyfV/
         Z/Xr7MK5udVTHMn6U4Sj+UdzfUyNMTIJo/UB7+8zk+pGYMbMz5IBycvzh9nMI3m60x50
         J2qLW0hnzlcy52CmviWAzIWH2djEDx0gx0Q9RQmIQDNfTJ5yWD7NffveXRXv1RoeUpJ+
         Zh1QmCfP1EOE/cVzeSOI9+8TalKTgevn/lThF61ryxg9gaGyNIwVzrlxiMXEgQrm4Kzo
         w/TCltWhNzotHXMHdWpxgXLPba6MiwPgMYiUH7LdQGBY/mFkJC2n/MFEuaOclA9hy4GM
         m8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792605389; x=1793210189;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l/9Q6vwSpHzLOuQcu+iZE9ek6ulZ0fAfcC9lHWm1vuA=;
        b=nFvRf/FNK1F2nYIfkyU9elsi9lFMt+EPDCDEn9UiYcPrv78aD4IOw8Argsm8fyMEHh
         r35bcUgE00oysdx/kiDa7e+ZjP7VyoO77UwmEYubwcUnhXSQyFn8ITV5R2dyaq208e5r
         KNogCnaq1UTRrcSdHl4UyL3fUDPQ8xdMtl/9RSNv+iUO1zcApyDlbeFxpVKKN9BK8ImC
         V4sJZ29V6HWjH2uz07zIqQaB/XaNm+SHkzfhwruXaNi1JxIPSDbofVWVk8lBQ4B/F3fI
         JxkoMTZ53KNAyM9MPztG3TXToWoZgObUfxqBbJ7eE1k0X4MrcckBXe88Pp5sJkbrQMv+
         RC+w==
X-Forwarded-Encrypted: i=1; AKwUvBx5xbZMh1jSGAlluepl3XA0DD1/f0Q0WAs2le0m4+IGbnqXD5uztMytz9pRzsdOUSL/vg1AtDCxMxXL1RAvzf9P@lists.infradead.org
X-Gm-Message-State: AFq9FYJ6x7aJL3E146ONxK/8Neebvcz93G2hhAw0TDZudxUelO/LWcdk
	z4wefYycA7K/k+2s/KArd+b2M1gpGSv3YXG9VPtQHCLhM+ftZ5HxsvpZPobdt6/Qhhy6YaM8NKz
	3M6tHbH30rQwLL6SkiUt+g5t2QD7jJodRn3i6yAdfqQ==
X-Gm-Gg: AYBFou0IgSvpHWZ/CE34O+7SiwCg51IZC1juw3yM7PC98UHy7squ6qSKYFUlc0TvPU0
	riFYZgUTCEONWs+D3GPfy1oEJtnd7CrK9Bf9ZUQP8V91jP9Hci0xyMkqd6z4ZK916ePx5XET+9L
	1AZbb66lQ1Y74KbHVyd3W5aiY/59gTV4FtToXkS6tRNv4lIcgNHW/LliXBxjVhlOpsUlJnD/ZXi
	+vBj40WFT1VYBXdZQuWaOuSiXvTph2LcfHTOC0L1x3i1rCyEpmucu4LyPoqOeq62nGGqxUCqXjS
	Y2RygDGPCq28lx2h4wBONFrSpZagxHxGUBjdlKAi+MCJxLO0JtfWeLwh+MyvLQdfhUEObkKAe1F
	uxj5sYLYxaSY9UQqmx5Rr2s9J0K1YrxXRTAuv2tnECh1e/yJj/Xj4pAch0Cf+X586/Q0=
X-Received: by 2002:a05:6402:458e:b0:6ac:686f:91db with SMTP id
 4fb4d7f45d1cf-6b408e9f045mr1964734a12.11.1792605389455; Wed, 21 Oct 2026
 10:56:29 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021152527.375070-1-tarunsahu@google.com> <20261021152527.375070-4-tarunsahu@google.com>
 <CA+CK2bAQbmq3ArP3XMErF_8RC2CUwvgpLY0H83D0nCJTaVKYyA@mail.gmail.com> <20261021174006.GU3008132@nvidia.com>
In-Reply-To: <20261021174006.GU3008132@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 21 Oct 2026 13:55:52 -0400
X-Gm-Features: AclHuK-Q6MQhxMIMUURzzci_OOwzGik9EFivN3YqqlGA_5OHu0xT6GsF67-BzDw
Message-ID: <CA+CK2bDJzo44K0X-+5F77E9g2dmqKdwZvrUf-1SkC7ewrgEgzA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/4] liveupdate: Replace compatibility string with
 a 2-bit pair feature header
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Tarun Sahu <tarunsahu@google.com>, Andrew Morton <akpm@linux-foundation.org>, joro@8bytes.org, 
	Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, maz@kernel.org, arnd@arndb.de, 
	David Matlack <dmatlack@google.com>, robin.murphy@arm.com, loganodell@google.com, 
	oupton@kernel.org, kevin.tian@intel.com, alex@shazbot.org, 
	dwmw2@infradead.org, pbonzini@redhat.com, seanjc@google.com, will@kernel.org, 
	Alexander Graf <graf@amazon.com>, Bjorn Helgaas <bhelgaas@google.com>, baolu.lu@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, 
	sagis@google.com, linux-mm@kvack.org, kvmarm@lists.linux.dev, 
	iommu@lists.linux.dev, linux-pci@vger.kernel.org, kexec@lists.infradead.org, 
	skhawaja@google.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_105631_492055_FE6FDEA4 
X-CRM114-Status: GOOD (  20.74  )
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

On Wed, Oct 21, 2026 at 1:40=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Wed, Oct 21, 2026 at 01:27:22PM -0400, Pasha Tatashin wrote:
> > On Wed, Oct 21, 2026 at 11:25=E2=80=AFAM Tarun Sahu <tarunsahu@google.c=
om> wrote:
> > >
> > > LUO and its file handlers validate handed-over state with monolithic
> > > compatibility strings ("luo-v5", "memfd-v2"). Any change to a seriali=
zed
> > > structure, even an optional additive one, must bump the string, which
> > > breaks live update between adjacent kernels. Replace the string in
> > > struct luo_ser with a feature header, so that the target kernel can
> > > accept or reject the source kernel state per feature.
> > >
> > > struct luo_feature_hdr is a fixed 128-byte header: the serialized
> >
> > This patch is all wrong; 128 bytes is far too large. For every _ser
> > struct, we only need 8 bytes instead.
> >
> > The first 4 bytes are the size, and the next 4 bytes are flags (i.e.,
> > 30 feature flags + 2 reserved bits for flags extension). The last two
> > bits of the flags indicate whether an extended flags field is present.
> > Each extended flags field is 8 bytes, and its last two bits indicate
> > that yet another extended flags field follows.
>
> I thought we agreed not to loose the string too, it was a tree
>  string -> feature flags -> individual values
>
> The string is the emergency if we really badly mess it up.

Yes, we'll still have the file-handlers/flbs compatibility strings.

>
> Jason

