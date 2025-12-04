Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73168D1D899
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 08:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jDjWZQe3+6D/+pCKm4TWMYRGvPgh/k3PH03ZqBx9dGw=; b=yJtlyYf/wxAqKMcewxTeGpK1Kw
	qfsweR/yULlo+2TKLwDI/FzFwD5yTddFUoOM0ADg9WRrCtD4+RU65rT7eTcFUkOBgXTznuWATpKkD
	u9TjU6Xd+i+GBzCahTVcb9iEGeIY+l1J2NdIkvttice/g+yJxTz7wpAO9OSYkyB+FC8TL+54OMrmG
	qNxDYuEnNrA80Beq2ymEKDkJH2pL8Pxj4jStme5WMuGp4/A9e3yFR4Vyy4T+wQ8PoCmSk05ie+088
	/TpTfxmjTMRh3/MwbWEOfWvVTLM30+OMPWICkTi4cNozkIuKAtCljkJxnRnNbVDyhOeet7si2lTGd
	bfpLBQjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4qo-00000007iJW-1uSx;
	Thu, 04 Dec 2025 08:38:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4ql-00000007iJ7-1QBx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 08:38:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7529339;
	Thu,  4 Dec 2025 00:37:57 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8ACB3F73B;
	Thu,  4 Dec 2025 00:38:04 -0800 (PST)
Date: Thu, 4 Dec 2025 08:38:02 +0000
From: Leo Yan <leo.yan@arm.com>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	quic_yingdeng@quicinc.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
Message-ID: <20251204083802.GI724103@e132581.arm.com>
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
 <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>
 <20251203182944.GG724103@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203182944.GG724103@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_003807_416894_A997F52E 
X-CRM114-Status: GOOD (  15.35  )
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

On Wed, Dec 03, 2025 at 06:29:44PM +0000, Coresight ML wrote:

[...]

> > +/* Read registers with power check only (no enable check). */
> > +static ssize_t coresight_cti_reg_show(struct device *dev,
> > +				      struct device_attribute *attr, char *buf)
> > +{
> > +	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
> > +	struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
> > +	u32 idx, val = 0;
> > +
> > +	pm_runtime_get_sync(dev->parent);
> > +	raw_spin_lock(&drvdata->spinlock);
> > +	idx = drvdata->config.ext_reg_sel;
> > +	if (drvdata->config.hw_powered) {
> > +		switch (cti_attr->off) {
> > +		case INDEX_CTITRIGINSTATUS:
> > +		case INDEX_CTITRIGOUTSTATUS:
> > +		case INDEX_ITTRIGINACK:
> > +		case INDEX_ITTRIGOUT:
> > +		case INDEX_ITTRIGOUTACK:
> > +		case INDEX_ITTRIGIN:

I read again and now I understand why you need "config.ext_reg_sel"
as an index for these expending registers.

I think you should extend attrs for the new adding registers:

  static struct attribute *coresight_cti_regs_attrs[] = {
      ...
      coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
      /* Qcom CTI only for triginstatus1/2/3 */
      coresight_cti_reg(triginstatus1, CTITRIGINSTATUS + 0x4),
      coresight_cti_reg(triginstatus2, CTITRIGINSTATUS + 0x8),
      coresight_cti_reg(triginstatus3, CTITRIGINSTATUS + 0xc),
      ...
  }

Then, you can add a is_visible() in coresight_cti_regs_group:

  static umode_t coresight_cti_regs_is_visible(struct kobject *kobj,
                  struct attribute *attr, int n)
  {
          struct device *dev = container_of(kobj, struct device, kobj);
          struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);

          /* Mute QCOM CTI registers for standard CTI module */
          if (!drvdata->is_qcom_cti) {
              if (attr == &triginstatus1.attr ||
                  attr == &triginstatus2.attr ||
                  attr == &triginstatus3.attr)
                  return 0;
          }

          return attr->mode;
  }

  static const struct attribute_group coresight_cti_regs_group = {
          .attrs = coresight_cti_regs_attrs,
          .name = "regs",
          .is_visible = coresight_cti_regs_is_visible,
  };

Thanks,
Leo

