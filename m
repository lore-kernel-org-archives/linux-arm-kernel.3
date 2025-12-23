Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63300E6F090
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 13:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jQ6IiHD3cdsFchHBZsv1iuzaV/K7XecIsTp4AbR5KfY=; b=Q4sRwbeVS9nNf/ZKiJ1GVUjZkP
	+wrSzx5Kw8LeTeRtv+4SIOsnRL6fVv+cc/PLb8TNGxmKLPzodQuz5jQ5lNK9JXCwxIgufp+gI0QXp
	vS16RVXPX8UMfmqMNPziPupCao5jtElCykl6f+TgF/SS58sv3iYFSARXBzvBMYdvORkatc4jFC+EE
	mjwTXtU/Qpq0k8wDcvrXsoGmH/gRXMy6zFSRgcCqlzbJFCkPvNSjCkEJqrMlHgPFaSghrdOT6GAuq
	VhpG3iT4dRYPRnrR81lcxlFOLp/FqVNdK7jIipxLeTfY9JkTLVQ4fvu9N3/+YdC7GstxlGxFOcSea
	UgYeB9RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY25N-0000000FWCu-1eEt;
	Tue, 23 Dec 2025 13:05:57 +0000
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY25J-0000000FWC5-3nsD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 13:05:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:subject:message-id:mime-version;
  bh=jQ6IiHD3cdsFchHBZsv1iuzaV/K7XecIsTp4AbR5KfY=;
  b=GeATMJvh/Jin3+SNkiFTW66UKfKLC8W96I/S/TQv2BKJ57p7hNjXbAuY
   cJopoU8WfNo47hQoSEnGafIN9x5weyH2wpiYdxSsgyXKdn38hdbOP7Eem
   kCqfiQl6AMQBCm41K2s/tmNSKq60x6O4q7sXEetR7p8WWJsP+9nxkGOqb
   w=;
X-CSE-ConnectionGUID: w3fwfvrpQuyxlKtGuyYUvA==
X-CSE-MsgGUID: lpc9P1RtRee447jytmNdiQ==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.21,170,1763420400"; 
   d="scan'208";a="255717808"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 14:05:48 +0100
Date: Tue, 23 Dec 2025 14:05:47 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Sascha Bischoff <sascha.bischoff@arm.com>, 
    linux-arm-kernel@lists.infradead.org, oe-kbuild-all@lists.linux.de
Subject: [arm-platforms:kvm-arm64/gicv5-full 80/82] arch/arm64/kvm/vgic/vgic-its-v5.c:1213:2-8:
 preceding lock on line 1181 (fwd)
Message-ID: <15556f41-78ab-7418-f686-4d796a3ecf38@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_050554_231398_878FC816 
X-CRM114-Status: UNSURE (   6.98  )
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

Pleas check whether unlocks are needed at line 1213.

julia

---------- Forwarded message ----------
Date: Tue, 23 Dec 2025 20:39:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [arm-platforms:kvm-arm64/gicv5-full 80/82]
    arch/arm64/kvm/vgic/vgic-its-v5.c:1213:2-8: preceding lock on line 1181

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
TO: Sascha Bischoff <sascha.bischoff@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/gicv5-full
head:   1426b88096b597395df4c82f089b87c62bab45da
commit: e01f1868ec7bf5d212cd8daf67da77fc8c1cd320 [80/82] KVM: arm64: gic-v5: Implement has/set/get attr for ITS MMIO regions
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-r064-20251223 (https://download.01.org/0day-ci/archive/20251223/202512232029.FJOH3tvX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512232029.FJOH3tvX-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/vgic/vgic-its-v5.c:1213:2-8: preceding lock on line 1181
   arch/arm64/kvm/vgic/vgic-its-v5.c:1213:2-8: preceding lock on line 1188

vim +1213 arch/arm64/kvm/vgic/vgic-its-v5.c

e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1167
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1168  static int vgic_v5_its_attr_regs_access(struct kvm_device *dev,
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1169  				 struct kvm_device_attr *attr,
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1170  				 u64 *reg, bool is_write)
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1171  {
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1172  	const struct vgic_register_region *region;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1173  	struct vgic_v5_its *its;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1174  	gpa_t addr, offset;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1175  	unsigned int len;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1176  	int align, ret = 0;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1177
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1178  	its = dev->private;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1179  	offset = attr->attr;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1180
e01f1868ec7bf5 Sascha Bischoff 2025-09-05 @1181  	mutex_lock(&dev->kvm->lock);
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1182
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1183  	if (kvm_trylock_all_vcpus(dev->kvm)) {
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1184  		mutex_unlock(&dev->kvm->lock);
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1185  		return -EBUSY;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1186  	}
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1187
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1188  	mutex_lock(&dev->kvm->arch.config_lock);
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1189
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1190  	if (IS_VGIC_ADDR_UNDEF(its->vgic_v5_its_base)) {
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1191  		ret = -ENXIO;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1192  		goto out;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1193  	}
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1194
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1195  	region = vgic_find_mmio_region(vgic_v5_its_registers,
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1196  				       ARRAY_SIZE(vgic_v5_its_registers),
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1197  				       offset);
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1198  	if (!region) {
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1199  		ret = -ENXIO;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1200  		goto out;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1201  	}
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1202
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1203  	/*
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1204  	 * Although the spec supports upper/lower 32-bit accesses to
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1205  	 * 64-bit ITS registers, the userspace ABI requires 64-bit
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1206  	 * accesses to all 64-bit wide registers. We therefore only
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1207  	 * support 32-bit accesses to 32-bit-wide registers.
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1208  	 */
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1209  	align = region->access_flags & VGIC_ACCESS_64bit ? 0x7 : 0x3;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1210  	len = region->access_flags & VGIC_ACCESS_64bit ? 8 : 4;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1211
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1212  	if (offset & align)
e01f1868ec7bf5 Sascha Bischoff 2025-09-05 @1213  		return -EINVAL;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1214
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1215  	addr = its->vgic_v5_its_base + offset;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1216
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1217  	if (is_write) {
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1218  		region->its_write(dev->kvm, its, addr, len, *reg);
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1219  	} else {
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1220  		*reg = region->its_read(dev->kvm, its, addr, len);
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1221  	}
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1222  out:
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1223  	mutex_unlock(&dev->kvm->arch.config_lock);
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1224  	kvm_unlock_all_vcpus(dev->kvm);
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1225  	mutex_unlock(&dev->kvm->lock);
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1226
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1227  	return ret;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1228  }
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1229

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

