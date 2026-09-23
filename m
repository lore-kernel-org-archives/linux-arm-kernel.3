Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94057C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xR9vza9etr0IGm3u7jG2NZTFoxUW0CkCe02O6iSs7bc=; b=wDYL8+mTLAru27wAmnexS6mTf4
	eDMBE7wgZRkw+Im7L702Wtm5QWFGOF6TNYNSLx6hEf9SqTEwPD3yWVH5egBscBkXoX7EuT1sW+3S1
	cIANoMh2KlJefYxnxjVaHzon9WLzqySGLpCi0keOSl4KvNxdsGUYLjWHRMwu48E24DQoayhd7lEKI
	SAF2Tg0mD6T0gd5l67lcqixAdEyBWW6Ba0jsnrI7WD23+Yl8/aPiFwaJPoeXy8F/0ZquLuZ8r7SS7
	j3L6VCF0CUoBe0wJW6bIka5rEK7x78faaJXLk1w2pr/KHP1xFhiony7pzUAhcOp98l2JZ507NRV4K
	9KfWzGOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RPH-000000098rl-24Ob;
	Wed, 23 Sep 2026 18:09:23 +0000
Received: from out-216.mta0.migadu.com ([2001:41d0:1004:224b::d8] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RPF-000000098r1-09Rx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:09:22 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=hp4x+ywzXvafJkCdP8u0POUn9g1o98sJr1Tn/DdIbhA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790186959; v=1; x=1790791759;
 b=Ks4cYNxs0v5y4HoWkW2mo/kiu2QZyoOLphuMcl8dKfcyqvumwn92aVth+JA8lDG6FZ1mmS8m
 8LKj3ySLdRwicpLusisFpdycwmzs4O2AYShzJbdDCTkfTF9AOBj53qhmeNx+crCPKDLSbtHVknt
 ffsBwCH92j2NaZZ8YsexskZU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c6de37e8e8ea2e44;
	Wed, 23 Sep 2026 18:09:19 +0000
X-Mizu-Trace-ID: c6de37e8e8ea2e44
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b778bdb5b8so877e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 11:09:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzvW1BPCv8r9kg3CnkMFOOGnL4QDRGsrdB604I6faXc0vFAPsSUkLJsg8qZxnEwOhU0yh5nAQyJlb1ZpvArvX+Q@lists.infradead.org
X-Gm-Message-State: AFuF++kTGTMAcHqO9UroUH1SVuCttbDJTJNpX6mJshMSujwh7dBCbH7h
	sRoFf8z0EaUAzztArXTv3bs+Cm5nnkLpegR4n3sfv86CIgwZn0+svI8PZB+phXNWyHVhivcbKdt
	eo0FUvW2ffwAeRRnGACeaKDfZ2cRXj7rulTkRpZuS
X-Received: by 2002:a05:6512:124d:b0:5b8:c230:1241 with SMTP id
 2adb3069b0e04-5b8dda17fd1mr39666e87.10.1790186953248; Wed, 23 Sep 2026
 11:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260922210839.3765444-1-fuad.tabba@linux.dev> <20260923093433.00006cab@oss.qualcomm.com>
In-Reply-To: <20260923093433.00006cab@oss.qualcomm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 23 Sep 2026 19:08:36 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxcXmOk-kvQQtrT1mku=gmn4P4RdZXU2iAQhj+hn7Hjtg@mail.gmail.com>
X-Gm-Features: AclHuK_L10VanL22RC296bQJntGVijw67vDS6niPFFu4Q6Xzn6rsFFWvoeRnmqs
Message-ID: <CA+EHjTxcXmOk-kvQQtrT1mku=gmn4P4RdZXU2iAQhj+hn7Hjtg@mail.gmail.com>
Subject: Re: [PATCH] PCI: iproc: Use __free(device_node) in iproc_pcie_msi_enable()
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Rob Herring <robh@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_110921_262454_BA11D9B4 
X-CRM114-Status: GOOD (  20.31  )
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

Hi Jonathan,

On Wed, 23 Sept 2026 at 17:34, Jonathan Cameron
<jonathan.cameron@oss.qualcomm.com> wrote:
[...]
> Hi Fuad,
>
> See the guidance notes in cleanup.h.   Linus has stated a couple
> of times that he really never wants to see = NULL pattern miles
> from where it is allocated.  Best you can do here is shift
> it down to immediately before of_msi_xlate(). It is fine to declare
> variables with destructors like this inline (i.e. not at top of function).
>
> Admittedly if the scope shown here had gone a few lines further this
> would look less bad!

Done: https://lore.kernel.org/all/20260923180703.3901185-1-fuad.tabba@linux.dev/

Cheers,
/fuad

>
>
> > ---
> >  drivers/pci/controller/pcie-iproc.c | 10 +++-------
> >  1 file changed, 3 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
> > index afb3aa38ac6bb..b4f4e6e1d4b41 100644
> > --- a/drivers/pci/controller/pcie-iproc.c
> > +++ b/drivers/pci/controller/pcie-iproc.c
> > @@ -1338,7 +1338,7 @@ static int iproc_pcie_msi_steer(struct iproc_pcie *pcie,
> >
> >  static int iproc_pcie_msi_enable(struct iproc_pcie *pcie)
> >  {
> > -     struct device_node *msi_node = NULL;
> > +     struct device_node *msi_node __free(device_node) = NULL;
> >       int ret;
> >
> >       /*
> > @@ -1357,18 +1357,14 @@ static int iproc_pcie_msi_enable(struct iproc_pcie *pcie)
> >       if (pcie->need_msi_steer) {
> >               ret = iproc_pcie_msi_steer(pcie, msi_node);
> >               if (ret)
> > -                     goto out_put_node;
> > +                     return ret;
> >       }
> >
> >       /*
> >        * If another MSI controller is being used, the call below should fail
> >        * but that is okay
> >        */
> > -     ret = iproc_msi_init(pcie, msi_node);
> > -
> > -out_put_node:
> > -     of_node_put(msi_node);
> > -     return ret;
> > +     return iproc_msi_init(pcie, msi_node);
> >  }
> >
> >  static void iproc_pcie_msi_disable(struct iproc_pcie *pcie)
> >
> > base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
>

