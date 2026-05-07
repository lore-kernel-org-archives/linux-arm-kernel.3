Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1082FCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 09:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4n+aDsyALeCGBRD1ksU7ggjHDo77fx04CNX0dFcHB38=; b=UtXwthyN1ue9Hxb+gQ3EffnrYJ
	pBkbhH9/rGsWGHJgQRAyTBjb2+Cdzo8Crnrf8lmD1JT3L6V9gR7ZJuUza8x6Wfec6hSsSY6wkfDRR
	0FLiXCaZJyBqzGaH/r6uKLCg9yWrGVJWD8/rt1E4r9aovSrXLftNzm09kmp8Wg4vNq/RrncnnSrjg
	JDmRvLza0XpOpbjTb1lBG873fM6u7j8KUBYDVB9StjWBx6tUq2jiQlXWBzh08QzAx1g2jiFG4Sh42
	6eCYC2zVls56x2Mp7TYWIIfJUi52QoFVkU3TbnvCNrqqdG84hw379gYFFZ6JY1Bf6fy/gjrM8VGlk
	64o5g9tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvS5-00000003PeL-1wRC;
	Thu, 07 May 2026 09:55:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvS4-00000003Pe8-1Eei
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 09:55:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F2D8060252;
	Thu,  7 May 2026 09:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C6DC2BCB2;
	Thu,  7 May 2026 09:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778147726;
	bh=6f4IUJ1E4ztQUpHbwhPfFSRZ/AcEMsNKjRAB71LwAPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p0eDM5N7LxyU5Wd+zRdrf12o7vwrbTAgQ011HoxS4viScLV1BEvFLDiwrlnntC/3i
	 VWdDQ3lUXRCEKECz+OurDuShpuY2jjTg1Vou9xLUfcMKSjHEVHLozO95Q8G1eOiNCj
	 d38kS9D5g9H5T2wyWKw3uA8UBxR9Dlv+JXrQKdLJFo5Un66oQHo3Ui5BRxvwTFbc2P
	 Ml/5TzdI+DQ5l3md01wyXdAYHK3j2GSmo4LJHkaVu6xHn/EiII+vuGYmaaFycSzqN8
	 9WazOB9Kfnsbgf/kzeYwR1nUCgUCJhcXedv5aCN+CEXQpBFs9zQlvLQnD2du80HcZk
	 75H3pWmR5wxzA==
Date: Thu, 7 May 2026 15:25:10 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Md Sadre Alam <mdalam@qti.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, brgl@kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v16 00/12] crypto/dmaengine: qce: introduce BAM locking
 and use DMA for register I/O
Message-ID: <ditrkd5jcxlx7onykxh6n3qhyoclfngmpp277y4t4qwc4vswoo@5os4o5lumidn>
References: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
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

On Mon, Apr 27, 2026 at 11:15:33AM +0200, Bartosz Golaszewski wrote:
> This missed the v7.1 cycle so let's try to get it in for v7.2.
> 
> Merging strategy: there are build-time dependencies between the crypto
> and DMA patches so the best approach is for Vinod to create an immutable
> branch with the DMA part pulled in by the crypto tree.
> 
> This iteration continues to build on top of v12 but uses the BAM's NWD
> bit on data descriptors as suggested by Stephan. To that end, there are
> some more changes like reversing the order of command and data
> descriptors queuedy by the QCE driver.
> 
> Currently the QCE crypto driver accesses the crypto engine registers
> directly via CPU. Trust Zone may perform crypto operations simultaneously
> resulting in a race condition. To remedy that, let's introduce support
> for BAM locking/unlocking to the driver. The BAM driver will now wrap
> any existing issued descriptor chains with additional descriptors
> performing the locking when the client starts the transaction
> (dmaengine_issue_pending()). The client wanting to profit from locking
> needs to switch to performing register I/O over DMA and communicate the
> address to which to perform the dummy writes via a call to
> dmaengine_desc_attach_metadata().
> 
> In the specific case of the BAM DMA this translates to sending command
> descriptors performing dummy writes with the relevant flags set. The BAM
> will then lock all other pipes not related to the current pipe group, and
> keep handling the current pipe only until it sees the the unlock bit.
> 
> In order for the locking to work correctly, we also need to switch to
> using DMA for all register I/O.
> 
> On top of this, the series contains some additional tweaks and
> refactoring.
> 
> The goal of this is not to improve the performance but to prepare the
> driver for supporting decryption into secure buffers in the future.
> 
> Tested with tcrypt.ko, kcapi and cryptsetup.
> 
> Shout out to Daniel and Udit from Qualcomm for helping me out with some
> DMA issues we encountered.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

For the whole series,

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks for incorporating all the comments, Bart!

- Mani

> ---
> Changes in v16:
> - Fix a reported race between dma_map_sg() called with spinlock taken
>   and the corresponding dma_unmap_sg() called without it by moving the
>   descriptor locking data into the descriptor struct
> - Also queue the TX data descriptors before the command descriptors to
>   match what downstream is doing
> - Tweak commit messages
> - Rebase on top of v7.1-rc1
> - Link to v15: https://patch.msgid.link/20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com
> 
> Changes in v15:
> - Extend the descriptor metadata struct to also carry the channel's
>   transfer direction and stop using dmaengine_slave_config() for that
> - Link to v14: https://patch.msgid.link/20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com
> 
> Changes in v14:
> - Don't return an error to a client which wants to use locking on BAM
>   that doesn't support it
> - Add a comment describing the DMA descriptor metadata structure
> - Fix memory leaks
> - Remove leftovers from previous iterations
> - Propagate errors from dma_cookie_assign() when setting up lock
>   descriptors
> - Link to v13: https://patch.msgid.link/20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com
> 
> Changes in v13:
> - As part of the DMA changes in the QCE driver: reverse the order of
>   queueing the descriptors in the QCE driver: queue command descriptors
>   with all the register writes first, followed by all the data descriptors,
>   this is in line with the recommandations from the BAM HPG
> - Set the NWD (notify-when-done) bit (DMA_PREP_FENCE in dmaengine
>   parlance) on the data descriptors to ensure that the UNLOCK descriptor
>   will not be processed until after they have been processed by the
>   engine. While technically the NWD bit is only needed on the final data
>   descriptor, it's hard to tell which one *will* be the last from the
>   driver's point-of-view and both the downstream driver as well as
>   the Qualcomm TZ against which we want to synchronize sets NWD on every
>   data descriptor,
> - Revert to creating the LOCK/UNLOCK command descriptor pair in one
>   place now that the NWD bit is in place,
> - Link to v12: https://patch.msgid.link/20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com
> 
> Changes in v12:
> - Wait until the transaction is done before queueing the UNLOCK command
>   descriptor
> - Use descriptor metadata for communicating the scratchpad address to
>   the BAM driver
> - To that end: reverse the order of the series (first BAM, then QCE) to
>   maintain bisectability
> - Unmap buffers used for dummy writes after the transaction
> - Link to v11: https://patch.msgid.link/20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com
> 
> Changes in v11:
> - Use new approach, not requiring the client to be involved in locking.
> - Add a patch constifying dma_descriptor_metadata_ops
> - Rebase on top of v7.0-rc1
> - Link to v10: https://lore.kernel.org/r/20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com
> 
> Changes in v10:
> - Move DESC_FLAG_(UN)LOCK BIT definitions from patch 2 to 3
> - Add a patch constifying the dma engine metadata as the first in the
>   series
> - Use the VERSION register for dummy lock/unlock writes
> - Link to v9: https://lore.kernel.org/r/20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org
> 
> Changes in v9:
> - Drop the global, generic LOCK/UNLOCK flags and instead use DMA
>   descriptor metadata ops to pass BAM-specific information from the QCE
>   to the DMA engine
> - Link to v8: https://lore.kernel.org/r/20251106-qcom-qce-cmd-descr-v8-0-ecddca23ca26@linaro.org
> 
> Changes in v8:
> - Rework the command descriptor logic and drop a lot of unneeded code
> - Use the physical address for BAM command descriptor access, not the
>   mapped DMA address
> - Fix the problems with iommu faults on newer platforms
> - Generalize the LOCK/UNLOCK flags in dmaengine and reword the docs and
>   commit messages
> - Make the BAM locking logic stricter in the DMA engine driver
> - Add some additional minor QCE driver refactoring changes to the series
> - Lots of small reworks and tweaks to rebase on current mainline and fix
>   previous issues
> - Link to v7: https://lore.kernel.org/all/20250311-qce-cmd-descr-v7-0-db613f5d9c9f@linaro.org/
> 
> Changes in v7:
> - remove unused code: writing to multiple registers was not used in v6,
>   neither were the functions for reading registers over BAM DMA-
> - remove
> - don't read the SW_VERSION register needlessly in the BAM driver,
>   instead: encode the information on whether the IP supports BAM locking
>   in device match data
> - shrink code where possible with logic modifications (for instance:
>   change the implementation of qce_write() instead of replacing it
>   everywhere with a new symbol)
> - remove duplicated error messages
> - rework commit messages
> - a lot of shuffling code around for easier review and a more
>   streamlined series
> - Link to v6: https://lore.kernel.org/all/20250115103004.3350561-1-quic_mdalam@quicinc.com/
> 
> Changes in v6:
> - change "BAM" to "DMA"
> - Ensured this series is compilable with the current Linux-next tip of
>   the tree (TOT).
> 
> Changes in v5:
> - Added DMA_PREP_LOCK and DMA_PREP_UNLOCK flag support in separate patch
> - Removed DMA_PREP_LOCK & DMA_PREP_UNLOCK flag
> - Added FIELD_GET and GENMASK macro to extract major and minor version
> 
> Changes in v4:
> - Added feature description and test hardware
>   with test command
> - Fixed patch version numbering
> - Dropped dt-binding patch
> - Dropped device tree changes
> - Added BAM_SW_VERSION register read
> - Handled the error path for the api dma_map_resource()
>   in probe
> - updated the commit messages for batter redability
> - Squash the change where qce_bam_acquire_lock() and
>   qce_bam_release_lock() api got introduce to the change where
>   the lock/unlock flag get introced
> - changed cover letter subject heading to
>   "dmaengine: qcom: bam_dma: add cmd descriptor support"
> - Added the very initial post for BAM lock/unlock patch link
>   as v1 to track this feature
> 
> Changes in v3:
> - https://lore.kernel.org/lkml/183d4f5e-e00a-8ef6-a589-f5704bc83d4a@quicinc.com/
> - Addressed all the comments from v2
> - Added the dt-binding
> - Fix alignment issue
> - Removed type casting from qce_write_reg_dma()
>   and qce_read_reg_dma()
> - Removed qce_bam_txn = dma->qce_bam_txn; line from
>   qce_alloc_bam_txn() api and directly returning
>   dma->qce_bam_txn
> 
> Changes in v2:
> - https://lore.kernel.org/lkml/20231214114239.2635325-1-quic_mdalam@quicinc.com/
> - Initial set of patches for cmd descriptor support
> - Add client driver to use BAM lock/unlock feature
> - Added register read/write via BAM in QCE Crypto driver
>   to use BAM lock/unlock feature
> 
> ---
> Bartosz Golaszewski (12):
>       dmaengine: constify struct dma_descriptor_metadata_ops
>       dmaengine: qcom: bam_dma: convert tasklet to a BH workqueue
>       dmaengine: qcom: bam_dma: Extend the driver's device match data
>       dmaengine: qcom: bam_dma: Add pipe_lock_supported flag support
>       dmaengine: qcom: bam_dma: add support for BAM locking
>       crypto: qce - Include algapi.h in the core.h header
>       crypto: qce - Remove unused ignore_buf
>       crypto: qce - Simplify arguments of devm_qce_dma_request()
>       crypto: qce - Use existing devres APIs in devm_qce_dma_request()
>       crypto: qce - Map crypto memory for DMA
>       crypto: qce - Add BAM DMA support for crypto register I/O
>       crypto: qce - Communicate the base physical address to the dmaengine
> 
>  drivers/crypto/qce/aead.c        |   8 +-
>  drivers/crypto/qce/common.c      |  20 ++--
>  drivers/crypto/qce/core.c        |  28 ++++-
>  drivers/crypto/qce/core.h        |  11 ++
>  drivers/crypto/qce/dma.c         | 163 +++++++++++++++++++++++------
>  drivers/crypto/qce/dma.h         |  11 +-
>  drivers/crypto/qce/sha.c         |   8 +-
>  drivers/crypto/qce/skcipher.c    |   8 +-
>  drivers/dma/qcom/bam_dma.c       | 217 ++++++++++++++++++++++++++++++++++-----
>  drivers/dma/ti/k3-udma.c         |   2 +-
>  drivers/dma/xilinx/xilinx_dma.c  |   2 +-
>  include/linux/dma/qcom_bam_dma.h |  14 +++
>  include/linux/dmaengine.h        |   2 +-
>  13 files changed, 404 insertions(+), 90 deletions(-)
> ---
> base-commit: 06ae5ec2a5f35da6b24d404d16310ee3553dba6f
> change-id: 20251103-qcom-qce-cmd-descr-c5e9b11fe609
> 
> Best regards,
> -- 
> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

