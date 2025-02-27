Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78374C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 01:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TcgW8SbjQSaa3gvEsH7H9zMa1QYHlH8EzMqCag0ggL0=; b=m2wz2Hq8sWp5vLqRGxgmxO45XS
	qWIUTm/ppbLw3Z2HHo8p01mQUncoMtlIsoUcl1UuMrVVzUHcHC18Sq+m3wx0ay+ueoJcrtFsQgly7
	GQcVPw6e3u/2/4sMbg5ssMnd3QiLz18qH47b5a7GKzZKwabXE4BM3dreKBPr5hQuisxJIn6aLGpST
	mJrSwWeRKh716Nimt0Y2EqzIc0v5kMRx4cK2/Fq9HH5olqJgL6vF7IyXaej+1MY2JZaBOu1JaJXrJ
	2KYww9IdxLi7ukjH370FKhLTe9sp+QrdqZbxBnbFULDZXlWVuIsOpdJHkGfyQ6bTCBKKiLmTnZTfM
	2VxjoAZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnSIV-00000005sBJ-0nVt;
	Thu, 27 Feb 2025 01:02:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnSGy-00000005rv2-3Scn;
	Thu, 27 Feb 2025 01:01:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD99861223;
	Thu, 27 Feb 2025 01:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80005C4CED6;
	Thu, 27 Feb 2025 01:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740618067;
	bh=Az777yEEvc7WNpZb40fbFEenMSc4zBZXmQAQcH1+SrQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UEoozr8165xSjeMQKQpHvilejSkF7ea3Evo63RS/b9hp3roHeAtHLM3EhZvbJAqZc
	 ogsNHvfZkdDdUo512fRWHvJyCZ8xuJidSuDJ8U4BZDu2QuwJMdEiObzsSk6Jr8ZQsi
	 j20E00sXJMW+XIbcf0hVNWofIDMzYCp8IYWI476UjJIgk/5Ni3sLFuTf87hiIPlyoM
	 9xAU/STIgTuk1r4tMsLVY6Hg8RZfMh7lp3EnonkYI8keB5Oe/z+RID4RP6Minkwt27
	 lG2OAX/8r5aaEpo8/h+fwQFAhUVFfyZFKQM7gzfN4xNShYb2XV6D7arhChHX/q0pos
	 8rh0QumR10lFQ==
Message-ID: <508a5ee6c6b365e8d9cdefd5a9eec769.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-1-126244146947@baylibre.com>
References: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com> <20250120-amlogic-clk-drop-clk-regmap-tables-v3-1-126244146947@baylibre.com>
Subject: Re: [PATCH v3 1/4] clk: add a clk_hw helpers to get the clock device or device_node
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 26 Feb 2025 17:01:05 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
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

Quoting Jerome Brunet (2025-01-20 09:15:30)
> Add helpers to get the device or device_node associated with clk_hw.
>=20
> This can be used by clock drivers to access various device related
> functionality such as devres, dev_ prints, etc ...
>=20
> Add test for these new helpers in clk-test.
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Thanks for adding tests!

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 9b45fa005030f56e1478b9742715ebcde898133f..9818f87c1c56ab9a3782c2fd5=
5d3f602041769c3 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -365,6 +365,39 @@ const char *clk_hw_get_name(const struct clk_hw *hw)
>  }
>  EXPORT_SYMBOL_GPL(clk_hw_get_name);
> =20
> +/**
> + * clk_hw_get_dev - get device from an hardware clock.

Please add () to indicate function.

> + * @hw: the clk_hw pointer to get the struct device from
> + *
> + * This is a helper to get the struct device associated with a hardware
> + * clock. Some clocks, such as the ones registered from an early clock
> + * controller, may not be associated with any struct device.

Maybe write out that an 'early clock controller' is one that registers
clks with CLK_OF_DECLARE() or otherwise didn't pass a device pointer
while registering the clk.

> + *
> + * Return: the struct device associated with the clock, or NULL if there
> + * is none.
> + */
> +struct device *clk_hw_get_dev(const struct clk_hw *hw)
> +{
> +       return hw->core->dev;

Maybe we should increment the device refcount and require callers to
put_device(). Now's our chance to make the change!

> +}
> +EXPORT_SYMBOL_GPL(clk_hw_get_dev);
> +
> +/**
> + * clk_hw_get_of_node - get device_node from an hardware clock.

'from a hardware' and remove the period.

> + * @hw: the clk_hw pointer to get the struct device_node from
> + *
> + * This is a helper to get the struct device_node associated with an
> + * hardware clock.
> + *
> + * Return: the struct device_node associated with the clock, or NULL
> + * if there is none.
> + */

Can you put the kernel-doc in the header prototype? I want to move all
the comments there so we can include the header in the rst doc file with
the header 'clk provider API' or something like that.

> +struct device_node *clk_hw_get_of_node(const struct clk_hw *hw)
> +{
> +       return hw->core->of_node;

Maybe we should increment the of_node refcount and require callers to
of_node_put(). Now's our chance to make the change!

> +}
> +EXPORT_SYMBOL_GPL(clk_hw_get_of_node);
> +
>  struct clk_hw *__clk_get_hw(struct clk *clk)
>  {
>         return !clk ? NULL : clk->core->hw;
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index f08feeaa3750bc86859294650de298762dea690a..4dcdde283598b7f940c653ebc=
0d5a5f4c27637a2 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -3077,6 +3084,80 @@ static struct kunit_suite clk_register_clk_parent_=
data_device_suite =3D {
>         .test_cases =3D clk_register_clk_parent_data_device_test_cases,
>  };
> =20
> +static void clk_register_dummy_device_driver(struct kunit *test)
> +{
> +       static const struct of_device_id match_table[] =3D {
> +               { .compatible =3D "test,clk-dummy-device" },
> +               { }
> +       };
> +
> +       clk_register_of_device_driver(test, match_table);
> +}
> +
> +/*
> + * Test that a clk registered with a struct device can provide back the
> + * struct device it was registered with.
> + */
> +static void clk_hw_get_dev_test(struct kunit *test)

The name of the test can tell us what it expects:

	clk_hw_get_dev_with_dev_gets_dev()
	clk_hw_get_dev_null_dev_gets_null()
	clk_hw_get_dev_with_node_gets_null() # this one uses of_clk_hw_register()
	clk_hw_get_of_node_with_dev_gets_node() # this one uses clk_hw_register()
	clk_hw_get_of_node_with_node_gets_node()
	clk_hw_get_of_node_null_node_gets_null()

I put some more test names. If we use gen params we can have spaces in
the name.

> +{
> +       struct clk_register_device_ctx *ctx;
> +
> +       ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +       test->priv =3D ctx;
> +
> +       clk_register_dummy_device_driver(test);
> +       ctx->hw.init =3D CLK_HW_INIT_NO_PARENT("test_get_dev",
> +                                            &clk_dummy_rate_ops, 0);
> +
> +       KUNIT_ASSERT_EQ(test, 0, clk_hw_register_kunit(test, ctx->dev, &c=
tx->hw));

Please put a newline between the assertions and the expectation. That
makes it easier to see at a glance what's expected by the test.

> +       KUNIT_EXPECT_PTR_EQ(test, ctx->dev, clk_hw_get_dev(&ctx->hw));
> +}
> +
> +/*
> + * Test that a clk registered with a struct device_node can provide back=
 the
> + * struct device_node it was registered with.
> + */
> +static void clk_hw_get_of_node_test(struct kunit *test)
> +{
> +       struct device_node *np;
> +       struct clk_hw *hw;
> +
> +       hw =3D kunit_kzalloc(test, sizeof(*hw), GFP_KERNEL);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
> +
> +       np =3D of_find_compatible_node(NULL, NULL, "test,clk-dummy-device=
");
> +       hw->init =3D CLK_HW_INIT_NO_PARENT("test_get_of_node",
> +                                        &clk_dummy_rate_ops, 0);
> +       of_node_put_kunit(test, np);
> +
> +       KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, np, hw));

The stuff before the expectation should likely go to the init function.
Or it can use the genparams stuff so we can set some struct members to
indicate if the pointer should be NULL or not and then twist through the
code a couple times.

> +       KUNIT_EXPECT_PTR_EQ(test, np, clk_hw_get_of_node(hw));
> +}
> +
> +static struct kunit_case clk_hw_test_cases[] =3D {
> +       KUNIT_CASE(clk_hw_get_dev_test),
> +       KUNIT_CASE(clk_hw_get_of_node_test),

Please add tests for the absence of the pointers.

> +       {}
> +};
> +
> +static int clk_hw_test_init(struct kunit *test)
> +{
> +       KUNIT_ASSERT_EQ(test, 0,
> +                       of_overlay_apply_kunit(test, kunit_clk_dummy_devi=
ce));
> +
> +       return 0;
> +}
> +
> +/*
> + * Test suite to verify the sanity clk_hw helper functions.

Test suite to verify clk_hw_get_dev() and clk_hw_get_of_node().

> + */
> +static struct kunit_suite clk_hw_test_suite =3D {

A better name is clk_hw_get_dev_of_node_suite

> +       .name =3D "clk_hw_test_suite",

Same, clk_hw_get_dev_of_node_suite.

> +       .init =3D clk_hw_test_init,
> +       .test_cases =3D clk_hw_test_cases,
> +};
> +
>  struct clk_assigned_rates_context {
>         struct clk_dummy_context clk0;
>         struct clk_dummy_context clk1;
> diff --git a/drivers/clk/kunit_clk_dummy_device.dtso b/drivers/clk/kunit_=
clk_dummy_device.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..5cc89aa11264428b09e47fd29=
c5f9ecfb8c32fdd
> --- /dev/null
> +++ b/drivers/clk/kunit_clk_dummy_device.dtso

Ideally the name of the file gives a clue to the name of the test suite that
uses it. Perhaps kunit_clk_hw_get_dev_of_node.dtso is better.

> @@ -0,0 +1,10 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +       kunit-clock-controller {
> +               compatible =3D "test,clk-dummy-device";

Maybe "test,clk-hw-get-dev-node".

> +               #clock-cells =3D <0>;
> +       };
> +};

