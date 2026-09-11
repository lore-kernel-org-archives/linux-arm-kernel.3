Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EACBC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 05:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgXj9iW4L8xDvAQnLVHYY9iMfqiEAgCZF8Tut2lsVRs=; b=dNMV3uE/CfGwgvDjzxwBZRuytn
	fVx6q7C96LD/XeJi/MFm1IUq1UykaNUympm9H0LMoMcSc9guv5xhK1qDfSIYhG0W5HDYJ/wQXL6fG
	y3toDKtZNRu5kke8rpVjcUFsqge4VWEKDAM9sgPu2kFfrdraQt7fQbf15BmFSz6OxUTOsGHpFp0hy
	VbhBZVn0BW3DhAIYYAGzizAt9WvTUO0+NX27/B12AEDP5FCYcTVb2P129FXDt8jxr0H/3aZ8GW+h5
	/iuMHybnDx9444eX4nNTiGvPEuVJeGSzXBzmxs2EH+/MM6AgCLxNiMkxx8Q4Ce9ya7zIsy7Ujy9s3
	IJ5UlbpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tTk-0000000Fq9k-2i7p;
	Fri, 11 Sep 2026 05:07:12 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tTg-0000000Fq9P-48rW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 05:07:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=bgXj9iW4L8xDvAQnLVHYY9iMfqiEAgCZF8Tut2lsVRs=; 
	b=rqNx6Y2vRspOzRws6KhcNKe9q0Y5z7Yl63mj2rZZT+RmuqaYGyLN5eNxSXQfJ6ppRHTAayEzOb2
	SP1BRIbe88AuVEvR8CvLcxEQZ/UKhRIV37+62Qo5YeXJhE3sInWAbnRZ7eBrlvAMqjmqddYs9+gVW
	C53AVqZtDTPOuWkGUFvdADOL51gVhoZPPF41WJOujfAACnbd1m3kRVVo2mpKD8tPFEOJLWH+8FqI4
	GFf1LNyAO1VmkKbRsCUuWGpS8ydQuZ7yKkF0rRaG0//2+TfI5CpPk7E/YdGE0+7qf7TJs4RT2KKjp
	s/RsPB3aHpiHYVP8RcarO+Ldsn8xLyU7sYJA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x4tTX-0000000Ctmc-24FK;
	Fri, 11 Sep 2026 13:07:00 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 11 Sep 2026 15:06:59 +1000
Date: Fri, 11 Sep 2026 15:06:59 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Chenghai Huang <huangchenghai2@huawei.com>
Cc: davem@davemloft.net, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, xuwei5@huawei.com,
	prime.zeng@hisilicon.com, liulongfang@huawei.com,
	qianweili@huawei.com, wangzhou1@hisilicon.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, will@kernel.org
Subject: Re: [PATCH v2] crypto: hisilicon/sec - remove SEC crypto block
 cipher accelerator
Message-ID: <aqOMc1vGnmiULh2E@gondor.apana.org.au>
References: <20260819075353.94500-1-huangchenghai2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819075353.94500-1-huangchenghai2@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_220709_034931_2786195F 
X-CRM114-Status: GOOD (  16.48  )
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

On Wed, Aug 19, 2026 at 03:53:53PM +0800, Chenghai Huang wrote:
> The Hisilicon SEC crypto cipher accelerator has been superseded
> by the newer SEC2 driver (drivers/crypto/hisilicon/sec2/). SEC2
> provides wider algorithm coverage and is the maintained path forward,
> and users have migrated to it.
> 
> The legacy SEC driver has had no active users for some time, and its
> primary maintainer, Jonathan Cameron, has moved on from Huawei and
> is no longer in a position to maintain it. With thanks to Jonathan
> for his contributions to this driver over the years, and with no one
> left to keep it up to date, remove it from the tree.
> 
> This drops the legacy SEC driver together with all of its residual
> configuration, devicetree binding and board description references:
> 
>   - drivers/crypto/hisilicon/sec/
>   - CONFIG_CRYPTO_DEV_HISI_SEC Kconfig option
>   - sec/ entry from drivers/crypto/hisilicon/Makefile
>   - Documentation/devicetree/bindings/crypto/hisilicon,hip06-sec.yaml
>   - hisilicon,hip07-sec device nodes and their supporting mbigen_alg /
>     smmu_alg infrastructure from arch/arm64/boot/dts/hisilicon/hip07.dtsi
> 
> Signed-off-by: Chenghai Huang <huangchenghai2@huawei.com>
> Reviewed-by: Longfang Liu <liulongfang@huawei.com>
> Acked-by: Eric Biggers <ebiggers@kernel.org>
> Acked-by: Wei Xu <xuwei5@hisilicon.com>
> ---
>  .../bindings/crypto/hisilicon,hip06-sec.yaml  |  134 --
>  arch/arm64/boot/dts/hisilicon/hip07.dtsi      |  280 ----
>  drivers/crypto/hisilicon/Kconfig              |   14 -
>  drivers/crypto/hisilicon/Makefile             |    1 -
>  drivers/crypto/hisilicon/sec/Makefile         |    3 -
>  drivers/crypto/hisilicon/sec/sec_algs.c       | 1122 --------------
>  drivers/crypto/hisilicon/sec/sec_drv.c        | 1307 -----------------
>  drivers/crypto/hisilicon/sec/sec_drv.h        |  428 ------
>  8 files changed, 3289 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/crypto/hisilicon,hip06-sec.yaml
>  delete mode 100644 drivers/crypto/hisilicon/sec/Makefile
>  delete mode 100644 drivers/crypto/hisilicon/sec/sec_algs.c
>  delete mode 100644 drivers/crypto/hisilicon/sec/sec_drv.c
>  delete mode 100644 drivers/crypto/hisilicon/sec/sec_drv.h

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

