Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A776AC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQbES28pq+4+5SdsOxa0hPCoAfkWzPeIh6+fD64KIF8=; b=a5IY7Gp0iyz7ACLqBoazgWF0hY
	qBw8PggEKNkzZyzB16QueVq31buupXjPlzIVuhWcdRstE6aYhGpqF8fmWuZdBisoIJ6iMBeHAfMzo
	CjxO+nzM4uS3NgzkKfW2swDIZ8KYnOr0WM/I/eD5DKZsC+zXKK/jNdSDvLNSbCChw9EVbApm7TYEj
	zGygG4X99AHl3wYE5jDUPvIk6ZZH/cB14PSxrnIXdo48OuIkSv+cPEgHjxvtmCkGvWWAn7M/khm04
	+0CtBqCP5nGlBXoEziIplQsAXo637tJ21xpID9nDXEgJTZ0iL043zxoV27SB9vULSXjn9+T0Ly3oH
	scLVcz1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RkH-00000009CrN-08R3;
	Wed, 23 Sep 2026 18:31:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RkC-00000009Cpo-3Dp5
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 18:31:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qQbES28pq+4+5SdsOxa0hPCoAfkWzPeIh6+fD64KIF8=; b=fTUSn69iRCr+3mQbKSHzUPAoaX
	UC0g71GGT5UzXH2YxusPEhS0cIrZwMFcO5JEfhsXdcQnLoWg8cK1OA0ViPW2ngAifiUjpSTOLmYZO
	E1fyJGomlV5nHNLPYsJ9qN8D3IhGTqQhG40Y+YqcnQDX7k3vVJfeecMycwTYICajTtAm1LvxI4VIL
	Anutt3IlgyUcdjZDEKHcTauedhbdqMp6Uh3VFAQaEzwMF9slPwAS+DoRvw2EBWVqc8vMjn1PP7mWc
	bt3Ar3lAEJIGARTIfNSMlHaZhVKWhs6Klew9Gy/Saq/6iKllmVSvUML7iApiNaqQ+6yW1U3XJfad8
	3ISv6OsQ==;
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Rk7-0000000F9wV-366h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:30:59 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-8623e5d435cso442291b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 11:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790188252; x=1790793052; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qQbES28pq+4+5SdsOxa0hPCoAfkWzPeIh6+fD64KIF8=;
        b=QZMezHca5m7Ay/hqXam1cZiHKz0GmdaeRr+le2bcPUPqOcO0jfRznK+1KbrBAJnySb
         7RxUIMEwXmzXEJ7U9FicI1j95/oWalAVCUTexQfG6qhpThQ8Kjq7No0ExiNai8o2QhDn
         S72uChd4NrZrFi9CIdy4ElUZHrsfRl00XMdSLq5+OvOzT6aQ/i4AO20STwQ5mKiSvcCl
         rXMNhhOI7jhR2VD+5Bdoayuuk7HjirauWUT7O1nr39ydZwvjb3Dm1K8tAE/fHycXqmg1
         lJt/ge7CpUuMRv2VH3duQF2dqwJWjsHm303WXXVz6Qx+/WrN3xKaVw8gDIKkF9Ekho/V
         mewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790188252; x=1790793052;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qQbES28pq+4+5SdsOxa0hPCoAfkWzPeIh6+fD64KIF8=;
        b=qxg+jTV4Yjjg3LPieeVnGmrY9LoCccAHoUdJYgucKgfv9liLtLj4P7Q2aAOUv4/1tv
         1jl/OONoO6h7gVhDElu8qJXY0h5XwIGwMJo0zATD5B270gnEIIwk3jd43xeQVjAIwfcf
         Q9s5qUoTdMoOp5QABkiaDfQEzM9fFQOLmufAm2m/kuSWrgBIoBXf4KBsdwXyOLv5304s
         RGQRABC9E4w6ZVlvgeF6d+vxy/G02v7TvUDlu9TkueSuJtPXsE3VX6uiQx1WVyasTXqq
         9BPk1E2tq5cxBp/T2Tm5sHw5tyj83uvWeqSJL5ToYnVR+BPn+FntUNFnyUQ6W+MzoqWK
         trww==
X-Forwarded-Encrypted: i=1; AKwUvBzdQf5M2dljlKkGQqHAHmMKHMoNnclWxMuUPFMacPEhDoT2oq8yw2CNvsAMHMxqves9BX/VoKgW8s+laTThMcdP@lists.infradead.org
X-Gm-Message-State: AFuF++m7Fx8FgOIDoZq+nTQm11CYzwtUVaZ6lCXAcFjpwx5hljAqAz/c
	nJaNRFVUCHkfiCIlyBN3LZQjkQ7PS6AD3G/lKT9jgSBqGNYtgNeRtD/ISZ6XAI0btQ==
X-Gm-Gg: AYBFou2+ba2BwRDtVvh/WLKQNLEiZOTcQ6NrQNkFwiiOP/gwN92lgEuWotEa9shP+JP
	ll42bfTkAqv1c4T/AV4p36ZTqFmZNwN6cfix8aJ6rLrt6/pByDZmSq8dpNeJ5DYZF8lVkviVJ1/
	oQSy+/vSGIlbgPfP6oXzZmtXtU4q5CbbJ/4T7EbdoF5Pf/CBXcQl0B62KZ7AYQ0LmTABXPoZdjG
	4Kv3cYkp1u32A6UvtDqrJYO55dAg6pCm+OQmQwq1FsLduV5IQAISFZGivavNxS7oDeJQJQl1R4J
	92AfRB8EjzgomhT1ekT+6dKhGyiktYdGRYttH141b3lf+7i8gsc6tlRBNzwUs1V70UMxBYypGAb
	91mwoZ1UwVLqVp7lENvMWodLO4CHJF0zPOpYUE9RPJyvemET1SfVjalEp3V5RQyZTy3hAz6Wy2M
	B650ZO+aPr5ReB/5y/+UBa4jezaV1bfPZcQEJQKio5GL4DZukE86sjC6oBqcbmiqyyXEMELZ97c
	UW6bWYh27XG/ujb5kNDDuOdc5E8BEDBRXneeEGcArUYBhnUT/g=
X-Received: by 2002:a05:6a20:7290:b0:3db:131b:8d8 with SMTP id adf61e73a8af0-3de0e7300c0mr45910637.14.1790188251251;
        Wed, 23 Sep 2026 11:30:51 -0700 (PDT)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c12besm1736810b3a.29.2026.09.23.11.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:30:50 -0700 (PDT)
Date: Wed, 23 Sep 2026 18:30:46 +0000
From: David Matlack <dmatlack@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, Leon Romanovsky <leon@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>, Mark Bloch <mbloch@nvidia.com>,
	netdev@vger.kernel.org, Oliver Upton <oupton@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Sean Christopherson <seanjc@google.com>,
	Steffen Eiden <seiden@linux.ibm.com>, Shuah Khan <shuah@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tariq Toukan <tariqt@nvidia.com>, Zenghui Yu <yuzenghui@huawei.com>,
	patches@lists.linux.dev
Subject: Re: [PATCH v7 00/10] mlx5 support for VFIO self test
Message-ID: <arQa1khEHzKOfkCK@google.com>
References: <0-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_193055_918437_165A81F5 
X-CRM114-Status: GOOD (  13.83  )
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

On 2026-09-21 07:35 PM, Jason Gunthorpe wrote:
> Add an mlx5 driver to VFIO self test. This is largely a remix of the
> existing VFIO mlx5 driver in rdma-core. It uses an RDMA loopback QP
> to issue RDMA WRITE operations which effectively perform memory
> copies using DMA. Since mlx5 has a stable programming ABI this
> should work on devices from CX5 to current HW. The device FW must
> support the QP loopback configuration.

> v7:
>  - Fix some compilation problems, kvm and the igb

> Jason Gunthorpe (10):
>   net/mlx5: Add IFC structures for CQE and WQE
>   net/mlx5: Move HW constant groups from device.h/cq.h to mlx5_ifc.h
>   net/mlx5: Extract MLX5_SET/GET macros into mlx5_ifc_macros.h
>   net/mlx5: Add ONCE and MMIO accessor variants to mlx5_ifc_macros.h
>   selftests: Add additional kernel functions to tools/include/
>   vfio: selftests: Allow drivers to specify required region size
>   vfio: selftests: Add dev_dbg
>   vfio: selftests: Add mlx5 driver - HW init and command interface
>   vfio: selftests: Add mlx5 driver - data path and memcpy ops
>   vfio: selftests: mlx5 driver - add send_msi support

>  .../selftests/kvm/include/arm64/processor.h   |    4 +-
>  tools/testing/selftests/kvm/irq_test.c        |    2 -

Sean and Marc/Oliver, can you take a look at the changes Jason made to
KVM selftests as part of this series before we merge this into the VFIO
tree?

