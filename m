Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6111AD1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 12:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrBr8QZtuxEZqbfOe78DsBh0lqZS8vtfsBSCHCqOztw=; b=acS6h0d/8hmuEsRKPA8HaQq2hG
	G///ORGuuR9d/VVHpkZdyYa6/pGjZ5mM9VjDG3Y0mFOK6b/WAMYUdR2REdYOfX0VvLh28ohmcf2OI
	6FFGyyR9Tai3MrsdD+Ap7b9O5XAaBvCbfMhcYDt4nP1KcCSd5nUspEx7n9ZdWqoQuIqHzAnzVPayA
	0S3pvk6u/Ycle4Z4krmLyU3+XP7pwXzrPcPHjIL71L7Xc6vjL7fSz3wqjaRWHUaGTIdLPj4pwv0jh
	NdN0JqHop4zDOWDowW1TjM2EvfqajdACTBAbAVaYXhapFGnQ07mGbK6V/aacD7aEC3G7wcW7XrZgT
	wiqMTJIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwge-0000000EEaJ-0XX6;
	Tue, 09 Dec 2025 12:19:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwgb-0000000EEZr-1I6Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 12:19:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D4AD1691;
	Tue,  9 Dec 2025 04:19:11 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1565C3F740;
	Tue,  9 Dec 2025 04:19:17 -0800 (PST)
Date: Tue, 9 Dec 2025 12:19:16 +0000
From: Leo Yan <leo.yan@arm.com>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: mike.leach@linaro.org, alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org, james.clark@linaro.org,
	jinlong.mao@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_jinlmao@quicinc.com, quic_yingdeng@quicinc.com,
	suzuki.poulose@arm.com, tingwei.zhang@oss.qualcomm.com
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
Message-ID: <20251209121916.GT724103@e132581.arm.com>
References: <CAJ9a7Vg9Efi-5eecfiUF82_Qq8Jg9imN5q1-VKYZoPVUxNpjhA@mail.gmail.com>
 <20251209081649.105623-1-yingchao.deng@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251209081649.105623-1-yingchao.deng@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_041921_394945_38731CAE 
X-CRM114-Status: GOOD (  13.67  )
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

Hi Yingchao,

On Tue, Dec 09, 2025 at 04:16:28PM +0800, Yingchao Deng wrote:
> Hi Leo & Mike
> 
> Based on Leo’s suggestions, I created a new patch, but there are three points that do not fully align with his recommendations:
> 
>     1. The helper function for returning the register address now returns only the offset, because returning the full address would conflict with cti_write_single_reg.

No need to change each callsite for cti_write_single_reg().  You could
update cti_write_single_reg() instead:

  void cti_write_single_reg(struct cti_drvdata *drvdata,
                            int offset, u32 value)
  {
          CS_UNLOCK(drvdata->base);
          writel_relaxed(value, cti_reg_addr(drvdata, offset));
          CS_LOCK(drvdata->base);
  }

>     2. For registers such as triginstatus1...3, I defined additional macros CTITRIGINSTATUS1...3. This is because CTITRIGINSTATUS + 0x4 equals CTITRIGOUTSTATUS, and to avoid conflicts with existing macros, I chose numbers starting from 0x1000 for the new definitions.

To avoid the register naming pollution, please don't define the common
names but only used for Qcom registers.

AFAIK, you even don't need to define these registers.  These registers
are only used for sysfs knobs, we can define an extra "nr" field (e.g.,
bits[31..28] for indexing these registers, something like:

  #define CIT_REG_NR_SHIFT          28
  #define CIT_REG_NR_MASK           GENMASK(31, 28)
  #define CTI_REG_GET_NR(reg)       FIELD_GET(CIT_REG_NR_MASK, (reg))
  #define CTI_REG_SET_NR(reg, nr)   ((reg) | FIELD_PREP(CIT_REG_NR_MASK, (nr))

  static struct attribute *coresight_cti_regs_attrs[] = {
  ...
    coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
    coresight_cti_reg(triginstatus1, CTI_REG_SET_NR(CTITRIGINSTATUS, 1)),
    coresight_cti_reg(triginstatus2, CTI_REG_SET_NR(CTITRIGINSTATUS, 2)),
    coresight_cti_reg(triginstatus3, CTI_REG_SET_NR(CTITRIGINSTATUS, 3)),
  ...

Then, you just need to decode "nr" fields in cti_qcom_reg_off().

>     3. Regarding the visibility of attributes for triginstatus1...3, since coresight_cti_reg produces an anonymous variable that cannot be directly referenced, I used coresight_cti_regs_attrs[i] to obtain the attribute corresponding to triginstatus1.

Okay, I get the meaning for "an anonymous variable" - there have no
field naming when define attr with the macro coresight_cti_reg().

but you could comparing the attr string?

  if (!strcmp(attr->name, "triginstatus1") ||
      !strcmp(attr->name, "triginstatus2") ||
      !strcmp(attr->name, "triginstatus3"))
      ...

Thanks,
Leo

