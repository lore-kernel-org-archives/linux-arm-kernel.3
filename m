Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC36C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 14:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8STauwTDAYu4AJ/YswLLkoEtlg49XW61JjuFzifRFes=; b=doXqLYyWZ2504cG86+Y3ghx1sU
	bOHkMeT5GQFgt4aDMioDKNhOzHnPlhD4AFry08pjzEzq50pGl9CkaONKenbhy51DhuXW/L9rnlN8D
	MGN8k9Z19mUeTumgZXQS3mMNvYvi0zxelEJr6FZRTiNbLqDif5rGJlZD+3KWrEtIsianXUT1jy6wH
	BnSV8pHbTaT0bfMrHS9G/uoGTMLaW6ihaB5hhgnJSe/h3cfRVi2iUflg9sh7xgwsk3oo+UYMU/SeX
	dgoJvaX0JMf7nw6rKe0S4jvKJPHbaVuL0DwyPiS0MAmwTOYHjdVpU6X3TiD/ecwVfhkYAP9TBFBHb
	V/AkYLUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu9hX-0000000GMIi-3oYc;
	Wed, 12 Aug 2026 14:13:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu9hV-0000000GMI7-3ave
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 14:13:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E56FE153B;
	Wed, 12 Aug 2026 07:12:55 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FFE63F632;
	Wed, 12 Aug 2026 07:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786543979; bh=5/qbyJFLZnK5If02zc/1VqK+s8MFUkazuVR13uPkCAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=imXr2p9XfQPS03rL3hubkL8+FG2FHXooJGyQjzjX3W/99pz2jm1hjYkR5g/1aYUWt
	 hQkF3v+8eSWzuKp844FXIKUqljnnE1hJM69ggiTmcoUbu+IfzZlI91afPKU2vD6xCF
	 86hNIlOqlfnIf+xMUvwnY9erQPoy9Xw8f43IcyJk=
Date: Wed, 12 Aug 2026 15:12:57 +0100
From: Leo Yan <leo.yan@arm.com>
To: moonafterrain@outlook.com
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Linu Cherian <lcherian@marvell.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] coresight: configfs: restrict address parameter value to
 root
Message-ID: <20260812141257.GK15499@e132581.arm.com>
References: <20260812-coresight-fixes-v1-1-53fbf4e73241@outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812-coresight-fixes-v1-1-53fbf4e73241@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_071301_936728_B1C1D0BD 
X-CRM114-Status: GOOD (  12.45  )
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

On Wed, Aug 12, 2026 at 05:13:14PM +0800, Junrui Luo via B4 Relay wrote:

> Mark parameters that can hold a kernel address, and give those a
> config_item_type whose 'value' attribute is 0600. Parameters holding
> plain numbers, such as the strobing 'window' and 'period' counts, keep
> the existing mode.

Thanks for reporting the issue.

The patch seems overly complex to me. I'd suggest:

--- a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
@@ -281,9 +281,16 @@ static ssize_t cscfg_param_value_show(struct config_item *item, char *page)
 {
        struct cscfg_fs_param *param_item = container_of(to_config_group(item),
                                                         struct cscfg_fs_param, group);
-       u64 value = param_item->feat_desc->params_desc[param_item->param_idx].value;
-
-       return scnprintf(page, PAGE_SIZE, "0x%llx\n", value);
+       struct cscfg_parameter_desc *param_desc =
+               param_item->feat_desc->params_desc + param_item->param_idx;
+       const char *name = param_desc->name;
+       u64 value = param_desc->value;
+
+       /* The kernel address should print with the "%pK" specifier */
+       if (!strncmp(name, "address"))
+               return scnprintf(page, PAGE_SIZE, "0x%pK\n", value);
+       else
+               return scnprintf(page, PAGE_SIZE, "0x%llx\n", value);
 }

We can add a flag (e.g., is_addr) in cscfg_parameter_desc to indicate
a parameter presents an address. Since currently only pstop's "address"
parameter has this issue, adding a general flag can be deferred until
it is actually needed.

Thanks,
Leo

