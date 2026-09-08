Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4A3C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 08:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBWRKk7UX/ff+c3v7t6kWQev9yRFohOR8d4r33nXWEQ=; b=Zbwq7RvWhb0nGxFVDvLEK4Qpoy
	GzjiFFTpVMcv4KsabcYkDFpJsCNgFbFFnOI0VDol3iDvw8shdELbfwK5hXvOx1C5vJZgB3pyqYmw1
	DJbwsWJLgOXvqdr/jq7JRuYeZ6cmWYYh126/nmdQm0zJ5z8MROYEp8/S2KiwpeRIQb8L70pmWJK1i
	o+lApnqj5o23u4aMrdxU4H43J7i6tQua3oIsc5cSZO8PJwhj6mKMPKMvCvrywcR7DrJb1FMbLFHG6
	KjI8USvJuA1bpQaYPuWIkOVeJJ7vAEjp4ow0nWX5oxxe8UCt1xJhRxCk5mxWM317VfB2+cTPAQJgc
	OumPQXUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qso-00000008LuR-2Gdp;
	Tue, 08 Sep 2026 08:08:46 +0000
Received: from out-191.mta1.migadu.com ([2001:41d0:203:375::bf] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qsl-00000008Lti-3Wi5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 08:08:45 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=wj96FLvK72m67pH3jNQ0C+1v/0ID0Ycr2wlTUU5TRzE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788854921; v=1; x=1789459721;
 b=PEEreKBUIr481fhXNzx2SRiPal87qaSXVk119bUkKizIMchTK//+FJ4iMg8VaWZYVhgimJwm
 DhEonu3Jf3PGFN8R/b7NdhlN65vwXc35Q6fPGgPLTlLZhEuEEnMTAkDQ04+r0kL5eIZGVJh38+V
 kTLfdMCJVTf36i21+49rvUao=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d49e8d5624b3ef9d;
	Tue, 08 Sep 2026 08:08:41 +0000
X-Mizu-Trace-ID: d49e8d5624b3ef9d
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so14275e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 01:08:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwBbK0poUFx8Je/Enh/eqdydHY8Sn45v0o+qhwOC6hf+7RqBZLPmBF+9MPY/j8+Uf11/jYoVNIkdHcXn/j0G+ey@lists.infradead.org
X-Gm-Message-State: AFuF++nKUafc88wOAldAgvag1MOexmh7F61kBYO/rLkjba07kRnfonlZ
	cFTLpfZWnj1LBuzPkiO+MdV7ByP3ebwuJy2LSuFq949rhTJih4tBe5tPlr0W+kZh8ajzEkRMjAV
	cXByMdo/8hpJZEaTeZdlLYZbOjuJeR6I3pVYk34CA
X-Received: by 2002:a05:6512:6412:b0:5ae:b918:79d5 with SMTP id
 2adb3069b0e04-5b74d1658d8mr213819e87.2.1788854919259; Tue, 08 Sep 2026
 01:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260826-arm64-52bit-va-v1-0-14ec98211363@fujitsu.com>
 <20260826-arm64-52bit-va-v1-1-14ec98211363@fujitsu.com> <CA+EHjTy6EH-d=O+dtRdWdTUkS0zkXeW=auxiK6N5Dc-yihrYRw@mail.gmail.com>
 <ap9oag87vZiuTVer@sm-arm-grace07>
In-Reply-To: <ap9oag87vZiuTVer@sm-arm-grace07>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 8 Sep 2026 09:08:03 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx+Dtt-v8_6g1Rj9vO6j_7zRwjxywjYUXbgUj+FfsV6Rg@mail.gmail.com>
X-Gm-Features: AcwNN1WmotBPGHexNMlSdHcPHTVxfo5f6HxmhkMWAF9Pb_2HyxTj1nidelDjEwA
Message-ID: <CA+EHjTx+Dtt-v8_6g1Rj9vO6j_7zRwjxywjYUXbgUj+FfsV6Rg@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: selftest: arm64: Support 5-level paging in stage
 1 translation table
To: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Takayuki Okamoto <tokamoto@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_010844_167517_B1F892B5 
X-CRM114-Status: GOOD (  16.78  )
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

Hi Itaru,

On Tue, 8 Sept 2026 at 02:44, Itaru Kitayama <itaru.kitayama@fujitsu.com> wrote:
...
> > This changes what level means for the existing three-level modes:
> > level 0 used to return the top-level entry and now trips the assert,
> > level 1 used to return the leaf and now returns the top level. No
> > caller in tree asks for either of those two levels, and the new
> > numbering matches the architecture.
>
> Yes, as you checked this change won't break current tests, so if you
> have better comments I will replace it with yours.

The code comment reads fine. What's worth adding is a commit-message
note on the behavior change:

  For 3-level (64K) modes this renumbers the levels to match the
  architecture: level 0 is no longer valid, level 1 is the top entry.
  No in-tree caller passes those levels.

...

> Yes, I've dropped the _va_size() function and instead, expanded a bit
> as you suggested the aarch64_get_supported_page_sizes() to check if vcpu
> can address upto 52-bit VA space or not (48-bit max).

Sounds good. One thing for v2: 52-bit VA support is per-granule, so a
single 52-vs-48 result won't hold across granules.
ID_AA64MMFR2_EL1.VARange is the 64K indicator. 4K and 16K get 52-bit
VA from LPA2.

Cheers,
/fuad

> Thanks,
> Itaru.
> >
> > Cheers,
> > /fuad
> >
> >
> > > +{
> > > +       struct kvm_vcpu_init preferred_init = {};
> > > +       int kvm_fd, vm_fd, vcpu_fd, err;
> > > +       u64 val;
> > > +       u32 va_range;
> > > +       struct kvm_one_reg reg = {
> > > +               .id     = KVM_ARM64_SYS_REG(SYS_ID_AA64MMFR2_EL1),
> > > +               .addr   = (u64)&val,
> > > +       };
> > > +
> > > +       kvm_fd = open_kvm_dev_path_or_exit();
> > > +       vm_fd = __kvm_ioctl(kvm_fd, KVM_CREATE_VM, NULL);
> > > +       TEST_ASSERT(vm_fd >= 0, KVM_IOCTL_ERROR(KVM_CREATE_VM, vm_fd));
> > > +
> > > +       vcpu_fd = ioctl(vm_fd, KVM_CREATE_VCPU, 0);
> > > +       TEST_ASSERT(vcpu_fd >= 0, KVM_IOCTL_ERROR(KVM_CREATE_VCPU, vcpu_fd));
> > > +
> > > +       err = ioctl(vm_fd, KVM_ARM_PREFERRED_TARGET, &preferred_init);
> > > +       TEST_ASSERT(err == 0, KVM_IOCTL_ERROR(KVM_ARM_PREFERRED_TARGET, err));
> > > +
> > > +       err = ioctl(vcpu_fd, KVM_ARM_VCPU_INIT, &preferred_init);
> > > +       TEST_ASSERT(err == 0, KVM_IOCTL_ERROR(KVM_ARM_VCPU_INIT, err));
> > > +
> > > +       err = ioctl(vcpu_fd, KVM_GET_ONE_REG, &reg);
> > > +       TEST_ASSERT(err == 0, KVM_IOCTL_ERROR(KVM_GET_ONE_REG, err));
> > > +
> > > +       va_range = FIELD_GET(ID_AA64MMFR2_EL1_VARange, val);
> > > +
> > > +       close(vcpu_fd);
> > > +       close(vm_fd);
> > > +       close(kvm_fd);
> > > +
> > > +       return va_range >= ID_AA64MMFR2_EL1_VARange_52 ? 52 : 48;
> > > +}
> > > +
> > >  void aarch64_get_supported_page_sizes(u32 ipa, u32 *ipa4k,
> > >                                       u32 *ipa16k, u32 *ipa64k)
> > >  {
> > >
> > > --
> > > 2.43.0
> > >

