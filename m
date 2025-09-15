Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA5CCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PnxrqVT4CJv7XwuStck11sanfs+LzKsDdzZRHTyGLHE=; b=jVZZEuVTt6CTvoi9IFlxLiQmRp
	LysQpyh38Moj5Ka5980gE/GFooc4KN9DVye1BeutDqhLfbb4Fk0HBuAc9JhSJ0xMaqHdzlohLPmnh
	uwCrZ0vT5LTLpF86f2JDMjSYJct7gMisdEVft3oYBC85kSsGY6to6rZwD55ZDqIWTfgvZzgV/vVqP
	YSKN4GF/zeffdFfVjxVtg2JOYL91sItj4oIMhpewsweGsjYoSmFY1FXjDlKayFxDK2U9Om7QSF0Nh
	7oI28NFOH3X2lvZyGCWePs2vxIjgZuVttE86RGBjO1RnzhkWOY5vxX9YAG+Oox+DVEq2C57VYUXGN
	zCQR0scA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6ly-00000003mTV-3FQk;
	Mon, 15 Sep 2025 10:49:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6ly-00000003mSu-0yXS
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 15 Sep 2025 10:49:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PnxrqVT4CJv7XwuStck11sanfs+LzKsDdzZRHTyGLHE=; b=K7n5vZxqjzxR1BEMpfQHeVsA9V
	z6b9qB3MtXKeeizERJLbjWCZqQW9ENWjCBoOyuwTvMSj8JkqkOSv9mKttyqmoxnmOi9c078kU7vD4
	lVNWE7O6WUdpCV62lCkcihOu6LMohc3u3IszPFaC7k+/n2fnGa34aunm8dyRhKTkxq7dsJ2bx0Tw8
	hJLsVUd+mzAuaF1hvPjOqKayKJfmsBDp3n5Nk2dDwh13vX1LFYsKtVHTnB6Uwljmc/OruQDanRNfI
	8zyOy/wlAw4OTEnV8N66JBg6ITf+fdS4KnZYscjKuF6Umqgsn8i0stZCWQgTIbnQCb/3X+9bmh14c
	KPsSZ0Mw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6lu-00000006wN1-3Nwd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:49:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 916E541AC2;
	Mon, 15 Sep 2025 10:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C20CC4CEF1;
	Mon, 15 Sep 2025 10:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757933360;
	bh=4DiSgYMz8F2wXzrctnA9iRgoWb2okBFC865kP4Gxo9c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UuYfNQK3/UM57VVpdB5oO0wZ4ZQeiVA/kSREV0ovvWmwrDrco4gN/VjyHeq2qhkCq
	 k8xV+E5MMzND4/h98kbspRJUR49XJH9q0bAK5C7ky8ZO2kGSUA8WXkmI7klFqpKa7i
	 VnM8FD8lpMn7oJPvFhSXb4iofemu21mizrNJ6cWZ4hH2F/Rxp9ti68uYNNXTjXSEcO
	 qtaboKSLJoxKorC7cfMcBs67G8UDC6qQGusiSiwFqO6wRtwaGcdHy5FTVIAhNNGXXA
	 h20je+sVSpN/t5EbVn/qAig0kfJm/ZGSyzMUF+PDAtdOXt7W+CqmfoSHKoE5x+QYOk
	 kkIxEqZjoZE4w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uy6lo-00000006Kwj-49Uw;
	Mon, 15 Sep 2025 10:49:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	quic_yingdeng@quicinc.com,
	jinlong.mao@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com
Subject: Re: [PATCH v2] KVM: arm64: Fix NULL pointer access issue
Date: Mon, 15 Sep 2025 11:49:14 +0100
Message-Id: <175793328164.659173.8404797812390171241.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250902-etm_crash-v2-1-aa9713a7306b@oss.qualcomm.com>
References: <20250902-etm_crash-v2-1-aa9713a7306b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, james.clark@linaro.org, yingchao.deng@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, quic_yingdeng@quicinc.com, jinlong.mao@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_114923_270329_53017EFC 
X-CRM114-Status: UNSURE (   9.78  )
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

On Tue, 02 Sep 2025 11:48:25 +0800, Yingchao Deng wrote:
> When linux is booted in EL1, macro "host_data_ptr()" is a wrapper that
> resolves to "&per_cpu_ptr_nvhe_sym(kvm_host_data, cpu)",
> is_hyp_mode_available() return false during kvm_arm_init, the per-CPU base
> pointer __kvm_nvhe_kvm_arm_hyp_percpu_base[cpu] remains uninitialized.
> Consequently, any access via per_cpu_ptr_nvhe_sym(kvm_host_data, cpu)
> will result in a NULL pointer.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Fix NULL pointer access issue
      commit 27d2b47eef033f1fc6c0452dc1017e43dad5fe14

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



