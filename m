Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C855C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3QvZlZS2o/VtqigJcsGK+8GMV91JrY1h073nzLy0fJ0=; b=QfS735P/DU4x5SuOLrtlZsjofj
	VMe+BG22jaL4vG7riuj335jaozggQtTXvYsfOlXkBsQGziPxlA2PJgJCoenKJZz9ixsWpf+5DkvVp
	ZczWhtt+Zr+dIP2qFFP3GhoiGvoPDJHRUMRcxno6fu5aZEwToLtpR2scuzH3WdojADzZU+zDbPG5v
	j4YnVd6fsjZFRqH1l8Vi3huMSbCeGpOpcm7459Atf+kIa7XxZbyV4gzz18CD3olVIKBJCrFoEWxjZ
	RMrp+WmXaaxGOxgmJoiLe7I21Vhosc0BWKq6YxDLRTwxLm6l/1gtTOQpXUkleuYw7SaSypqnl/sEO
	pF11HHig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nZM-0000000Bpgg-40LU;
	Thu, 24 Sep 2026 17:49:16 +0000
Received: from out-20.mta1.migadu.com ([95.215.58.20] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nZK-0000000BpgB-2PAO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:49:16 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=VhHsaKDyj6btt2rJ0mEf5ooJRJ5wjzeYOU6EzYm9i7w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790272152; v=1; x=1790876952;
 b=KNNYCzlVLjucc/fZINBzr++VlE+Vzklw7XzRIEwuQfxm2OeXunObXUtlPdsRrwFcygldUVVC
 s70t0Df7UvIeo8yRb94lD5bhGxCR9RBeBkXyX4XN/T6OghaeVhBLQm/itaQ6L6MeaI9XPgIoZc6
 lDc0kXMD/016YsfX2stC51zA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 618ff6e46ab2eadc;
	Thu, 24 Sep 2026 17:49:12 +0000
X-Mizu-Trace-ID: 618ff6e46ab2eadc
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b8c42da963so945e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:49:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwcVFHtk80B3v4/8Jznq6AtUV1BHUYcuZQHElEIyBpVxsDsyLjJA65vcBB6SEivtudxgMqmobONDh5+6Uh5M0gt@lists.infradead.org
X-Gm-Message-State: AFuF++lbKx0JSUdHb7o9NsygPqWF36SA6oduyeG+ODJjntHXeQRo4Z4z
	K0DYk4cQgXyVgWMGedFYudmSU/DkbL/tyla8RbCnXikwBD45kaGtcC3Aa83mtLfvgqyknRkQQrv
	S4Uv3P2R51QFflR6V+8Y14JVaA7rW3vVO33/eee10
X-Received: by 2002:a05:6512:23a9:b0:5b1:5141:9156 with SMTP id
 2adb3069b0e04-5b8e5793dcbmr8212e87.9.1790272147649; Thu, 24 Sep 2026 10:49:07
 -0700 (PDT)
MIME-Version: 1.0
References: <20260924161514.1112730-1-fuad.tabba@linux.dev>
 <20260924161514.1112730-4-fuad.tabba@linux.dev> <86pky24kxz.wl-maz@kernel.org>
In-Reply-To: <86pky24kxz.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 24 Sep 2026 18:48:31 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxR4+VMm99w3fL27SCTi2r3GUPF5F5zp9tqqss6dCL0hg@mail.gmail.com>
X-Gm-Features: AclHuK8ICoSXw_nkuEqpc9E_Pai04k86x8jUnxS_KW-AQa1FK-xcq-uTx9S5r8k
Message-ID: <CA+EHjTxR4+VMm99w3fL27SCTi2r3GUPF5F5zp9tqqss6dCL0hg@mail.gmail.com>
Subject: Re: [PATCH 3/3] irqchip/gic-v3: Don't register a redistributor that
 was never counted
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, James Morse <james.morse@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_104914_759353_0A516D5C 
X-CRM114-Status: GOOD (  10.18  )
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

On Thu, 24 Sep 2026 18:29:28 +0100, Marc Zyngier <maz@kernel.org> wrote:

[...]

> Shouldn't this also update the broken_rdist bitmap?

Yes, it should. Without it gic_check_rdist() returns 0 and cpuhp
brings the CPU up. Sashiko raised the same [1], and I was in the
middle of replying with this:

        /* Not counted by gic_acpi_match_gicc(), so there is no slot for it */
        if (!gicc->gicr_base_address) {
                int cpu = get_cpu_for_acpi_id(gicc->uid);

                pr_warn(FW_BUG "GICC entry with ACPI UID %u has no
GICR base address, CPU kept offline\n",
                        gicc->uid);
                if (cpu >= 0)
                        cpumask_set_cpu(cpu, &broken_rdists);
                return 0;
        }

I'll fold it into a v2.

Cheers,
/fuad

[1] https://sashiko.dev/#/patchset/20260924161514.1112730-1-fuad.tabba%40linux.dev

