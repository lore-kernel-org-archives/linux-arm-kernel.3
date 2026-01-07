Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265A8CF6BED
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 05:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmJHXiqHc+iECf0VqMaKi1nRY5ftnlb6K1jtRASguiA=; b=B5JM3Pfw7EF30Zrr1e+ZpDc9a8
	zKj8jj7rc34AugbpwFw7IjgBCvo9nEgyQGQsF+4NBJixz+hw6sbpyjq4LYBj2WCCzSx3QpzUcHYPD
	VpAQ9jBJkWVvRmT+xvBwKB3EmjTa7WoSidPF0/3D0S7F+g5fW+LoVcauPPIbINrhlRG5azPkZQgm5
	TrTmNV5T9Qugam4msBTLtRIhw0dnc0oa84Fqk1xqAMbNH4p5qa2PuF020f7MVVKUvzMzxtMHYeBfl
	CUEJysbelXBvbUZeUx+MyHFqN6PB/yhdvYfvpA9iZKSiO7lg5SbDZeLtbHBA7n6fPZEj+RZ0bGVKF
	e5QV5PMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdM7s-0000000EB92-1P5i;
	Wed, 07 Jan 2026 05:30:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdM7p-0000000EB8i-2J9Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 05:30:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C2B5143956;
	Wed,  7 Jan 2026 05:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27671C4CEF7;
	Wed,  7 Jan 2026 05:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767763827;
	bh=4/ZQf8VUUfoUZh1OPYhG0F92DKQ4JV2XdIHkXpnMYdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0aPQ/QcomjudM2w+aZ6vT6EgNKEfBUjVnU4lT2k6WugoJ+ZdHVdc12uDMziqBi+M4
	 qJ/QeNTv9U75LAzW9pp/BvqcxsgrhnepgzAqiQVcQPGwQvbi4aWZimds7rtjOYkFtO
	 d81YrJEnibCiiMzVLqiqNmktYxeXk/WIshewk5qE=
Date: Wed, 7 Jan 2026 06:30:24 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: fsl-mc: add missing fsl_mc_bus_dpdbg_type
 declaration
Message-ID: <2026010755-registrar-agreeably-a626@gregkh>
References: <fd30e197df618be4444f9d2172ba794e5f49ae87.1767725589.git.chleroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd30e197df618be4444f9d2172ba794e5f49ae87.1767725589.git.chleroy@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_213029_756674_F5AC11A9 
X-CRM114-Status: GOOD (  15.77  )
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

On Tue, Jan 06, 2026 at 07:54:21PM +0100, Christophe Leroy (CS GROUP) wrote:
> Fix following sparse warning:
> 
>   CHECK   drivers/bus/fsl-mc/fsl-mc-bus.c
> drivers/bus/fsl-mc/fsl-mc-bus.c:435:26: warning: symbol 'fsl_mc_bus_dpdbg_type' was not declared. Should it be static?
> 
> As it is exported it can't be static. So declare it in mc.h like
> all other similar objects.
> 
> Fixes: e70ba1b06c26 ("bus: fsl-mc: add the dpdbg device type")
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> ---
>  include/linux/fsl/mc.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
> index 897d6211c1635..28441a456bb48 100644
> --- a/include/linux/fsl/mc.h
> +++ b/include/linux/fsl/mc.h
> @@ -451,6 +451,7 @@ extern const struct device_type fsl_mc_bus_dpdcei_type;
>  extern const struct device_type fsl_mc_bus_dpaiop_type;
>  extern const struct device_type fsl_mc_bus_dpci_type;
>  extern const struct device_type fsl_mc_bus_dpdmai_type;
> +extern const struct device_type fsl_mc_bus_dpdbg_type;

As it's obviously not used anywhere, this should not be the fix, please
just mark it static and remove the EXPORT_SYMBOL_GPL() as well.

thanks,

greg k-h

