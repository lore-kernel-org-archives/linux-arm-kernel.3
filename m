Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901E110ED651
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 10:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:CC:To:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IZqQrxOJ+/fPREYLH6yjljOestDU/g/f7XNhlIo3KmQ=; b=yuxQBZS4vv/EDNka0SBc2OepVB
	MYA06c+tTUNYjRW5PXnJz0QrXx9lcNfbQ9J/LWwwycoTKxkWXeBASxpj8q8VrNlwiXrUWpgZd+3v/
	XYYbglvysSIycCkkFwU0V9RZU0V8LlqHFyrAhnAWoYpezXviBR1LUA6/2Bgqh8xzLIAzwXrfD9K2t
	H5qcZ8wgaJBzoamGJWERORg2YnHLLo9FCEwrpqvaj4Q51Pz+IjYR0AIDvNV6ITPHnWDZrXWl6mfTy
	k8hwKtkf8z6wgvc8/jWxUuJoFzkxfs1YRhodLCIlLHlk8jgiAVZ1yKYRh7yiMeHwa+nomDh54mE+W
	Ap+4UmeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w64KT-000000079Ip-0DCT;
	Fri, 27 Mar 2026 10:22:13 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w64KO-000000079Hj-02e7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 10:22:12 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=IZqQrxOJ+/fPREYLH6yjljOestDU/g/f7XNhlIo3KmQ=;
	b=Poar77jdH47hoD4CDmNRxjbUjWlAIY3TqU7S4Ro2/WicplXw4UtK7cOExbUIVt/2rKvgoZPQb
	pde0Gt8C5QR4Bbae6P+kHeZ93w+Hgj2byp/UfjQcbyuKpoEWqQA+LmpsPvGs1mvpA0nilJQ53EW
	AMG0iMg1eBa4qUMXl2uJioc=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fhxPW0Fd7z1T4Kj;
	Fri, 27 Mar 2026 18:16:15 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id ED2BB2022B;
	Fri, 27 Mar 2026 18:21:48 +0800 (CST)
Received: from [10.67.120.170] (10.67.120.170) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 27 Mar 2026 18:21:47 +0800
Message-ID: <d13fdc75-b647-44f3-9657-d592353e8a1a@huawei.com>
Date: Fri, 27 Mar 2026 18:21:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Qinxin Xia <xiaqinxin@huawei.com>
To: <ben.horgan@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<dave.martin@arm.com>, <david@kernel.org>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <james.morse@arm.com>,
	<jonathan.cameron@huawei.com>, <kobak@nvidia.com>, <lcherian@marvell.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <punit.agrawal@oss.qualcomm.com>,
	<quic_jiles@quicinc.com>, <reinette.chatre@intel.com>,
	<rohit.mathew@arm.com>, <scott@os.amperecomputing.com>,
	<sdonthineni@nvidia.com>, <xhao@linux.alibaba.com>, <zengheng4@huawei.com>,
	Linuxarm <linuxarm@huawei.com>
Subject: [Question mpam mpam/snapshot+extras/v6.18-rc1] Question with
 Configuring iommu_group in 'task'
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.170]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemj200003.china.huawei.com (7.202.194.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_032208_778841_16F6352A 
X-CRM114-Status: UNSURE (   4.22  )
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


Hello everyone!

In earlier versions, mpam supports the configuration of iommu_groups.

  823 static ssize_t rdtgroup_tasks_write(struct kernfs_open_file *of,
  824                                     char *buf, size_t nbytes,
loff_t off)
  825 {
  826         struct rdtgroup *rdtgrp;
  827         int iommu_group_id;
  828         bool is_iommu;
  829         char *pid_str;
  830         int ret = 0;
  831         pid_t pid;
  832
  833         rdtgrp = rdtgroup_kn_lock_live(of->kn);
  834         if (!rdtgrp) {
  835                 rdtgroup_kn_unlock(of->kn);
  836                 return -ENOENT;
  837         }
  838         rdt_last_cmd_clear();
  839
  840         if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED ||
  841             rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
  842                 ret = -EINVAL;
  843                 rdt_last_cmd_puts("Pseudo-locking in progress\n");
  844                 goto unlock;
  845         }
  846
  847         while (buf && buf[0] != '\0' && buf[0] != '\n') {
  848                 pid_str = strim(strsep(&buf, ","));
  849
  850                 is_iommu = string_is_iommu_group(pid_str, 
&iommu_group_id);

What puzzles me is why we would put it under 'task'—this seems a little
  strange to users.It seems they are not related.Why don't we add a new
interface like 'iommu'?

  851                 if (is_iommu)
  852                         ret = rdtgroup_move_iommu(iommu_group_id, 
rdtgrp, of);
  853                 else if (kstrtoint(pid_str, 0, &pid)) {
  854                         rdt_last_cmd_printf("Task list parsing 
error pid %s\n", pid_str);
  855                         ret = -EINVAL;
  856                         break;
  857                 }
  858
  859                 if (pid < 0) {
  860                         rdt_last_cmd_printf("Invalid pid %d\n", pid);
  861                         ret = -EINVAL;
  862                         break;
  863                 }
  864

In future glue versions, will you re-enable support for iommu_group, and
if so, will the configuration scheme be changed?

-- 
Thanks,
Qinxin


