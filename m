Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF48606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 08:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dKxXvwLI;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UQ/DM8Yx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HeN8sKTlUL/VwaqkACE76c/cgf/RcKGyONBxScYlrEc=; b=dKxXvwLIpKjE8c1GYz++qRBdbg
	7SAqnsb56OwQFm2eMW2Pu7p59qogExmO9Gm4F4ni8BIdIG6znzBi6n3ry9x+/YOXPNf4h/2LwtGLK
	umkymid1JvTZ0Gomtj8gjaCRueWdVsjTOM4gE3evKzEKWCGKWZLBuv4njL7hbvYcDtg1TafvZqz4m
	/u0X4PHqm0mRvbKcb4u6eWtt2R7He6ad5b6NyJ9WGXRtlPd+o1OPyAjDN9Zlk4nF3Ionhbi/YeNSy
	eljjT7/8YD5MsyFa37FEXVNYH2GKi+cwokHs68PwJefPFiwnqep068DCt4WB/yp9crNmHKBJtFgPu
	rDgHCFMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFxl-00000001wJA-1iwX;
	Mon, 26 Oct 2026 08:21:49 +0000
Received: from out-107.mta1.migadu.com ([95.215.58.107] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFxi-00000001wIH-2GxQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 08:21:48 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=HeN8sKTlUL/VwaqkACE76c/cgf/RcKGyONBxScYlrEc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793002904; v=1; x=1793607704;
 b=UQ/DM8Yxh+CE1VqZrT8hgxcAFzevlYys88YQQqzCEG4WLep6seWzB6VSl/ax7ATSgjBLan4Q
 6S2T2KbWv0U/Sjo3XAi1yGpwHmUOxQ1KgWoZGq83/vThAyL/4KUegeAzhZuzVY0fWdkkEZpepte
 uqdPvS9mfAztQI3UCJBZCCf8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a3bbbc6c12cd0eea;
	Mon, 26 Oct 2026 08:21:44 +0000
X-Mizu-Trace-ID: a3bbbc6c12cd0eea
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be4a7b9e6fso6284e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 01:21:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw0RACieqmhGpcJFfARZK66dJfPbZR2HrSyGsg4uHYVyFPZ/IAyv3CE5nH+VLsNNwKD9D130H89OMpyQZ0GQ/2s@lists.infradead.org
X-Gm-Message-State: AFq9FYKoXD3uxYhunbRgVVNEng2CNqFDySLYTDwSWNUfeE/1LSDPPR7D
	C9XqBhmURM8jm2rdqfLuammiIUslsqXIwVFvnNYctPsh6seuT/MYS1KLxq7JbV3vbsEyJfoDTYJ
	YNsOW2P+A4JmeSrrGZBayILnuxFMMsh6x8sJoL+oY
X-Received: by 2002:a05:6512:3091:b0:5be:4d73:e44d with SMTP id
 2adb3069b0e04-5bfb79db1f6mr139727e87.5.1793002898251; Mon, 26 Oct 2026
 01:21:38 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261026-b4-vncr-mapping-test-v3-1-7c094a00d46e@fujitsu.com>
In-Reply-To: <20261026-b4-vncr-mapping-test-v3-1-7c094a00d46e@fujitsu.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 26 Oct 2026 08:21:02 +0000
X-Gmail-Original-Message-ID: <CA+EHjTy=bU1ygvgYiwKiWpxP4XTY_QEmkMgW=Bxd1pxyFZ0qdA@mail.gmail.com>
X-Gm-Features: AclHuK9mNQcdy23LyjVrKUw6ZiFaEhEa1RjPtCWEqLpOPj2wxuYrSqZs8yklhYY
Message-ID: <CA+EHjTy=bU1ygvgYiwKiWpxP4XTY_QEmkMgW=Bxd1pxyFZ0qdA@mail.gmail.com>
Subject: Re: [PATCH v3] KVM: arm64: selftests: Test VNCR translation invalidation
To: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_012146_986896_CDAC6A94 
X-CRM114-Status: UNSURE (   6.45  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Itaru,

On Mon, 26 Oct 2026 03:10:10 +0000, Itaru Kitayama
<itaru.kitayama@fujitsu.com> wrote:
[...]

These are from v2, and I didn't retest v3 since it only makes the
changes I asked for. In cases like this, feel free to keep my tags on
the respin.

Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

