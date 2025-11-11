Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FB1CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 01:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLVIvplMOEcp+H5C8YJoqUOJiueaZ6ZG+Ea5xvO4C/Y=; b=uwylL/xL/iDyuOlRhUbo6mVJHS
	CmS/Dco/PKgZrNYXB0QRG6SyJG9vWGb9Ep5Yt/hPa7urMUcTRgKqN9S/DOsl4OfwN5upSD1WyWJ5d
	hiOoS5s1XPJxFc+kx8VM5fLDrH7PbJStQsVI4P10telS0ZAAXhLAZPh2X9WpLNOr9g8tk+k2OvkXS
	rZqbILDDSqU6Wn882LkiWK4lHW9VcDzuSkI3OzatZw/ZyvpByQOM3H3yCZtG6vAMAjxcAhcYneTKJ
	zk4LK/jbTidVxWAgMGWsOW/6y7JYmfdJiBszpQ/HF/VWo0T13vlzE3zcfkynmn0Ow0NV9icqC8JJB
	K93HbElQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIdBf-00000006Kg2-0LzY;
	Tue, 11 Nov 2025 01:28:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIdBc-00000006Kfc-3Mdi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 01:28:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B285439E4;
	Tue, 11 Nov 2025 01:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E02C16AAE;
	Tue, 11 Nov 2025 01:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762824523;
	bh=hIEDz7mFJDt47GLd6MQk3+qekT9YS/OeDoeWC9NFHGs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=cMHl+5eFIDrpf7oqDMGo9dvbPm4kxa9IjFIzGuuSb5W4Y3rIZwnXqqUiBEFBA7xhv
	 hJCjg3BsZ9Mb+2NpXl84/2ImMsARku4Qafejp5zNOMX5bqWVId20jR+exT9LQFqM4i
	 cFi6e15yp2PE+YPDsOV2OBAXdstsHYtwQI2SiOBmqogrU6fN2FYV95V8LYRj4kL3ze
	 +LFfMpKH8OLpwPPWYhTxsb7vTRQ8ixNZ149OfRgDgDfNBaG2vtT/zaSoH518glPhcX
	 oD9zNGyCyjjYJHJA5XRM5LECNGLkeMzIboYaYNf7zu/mpIg4nE/bwPfS798RnIahQA
	 kN4YgF/hIMT4w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251002092036.2504858-1-wenst@chromium.org>
References: <20251002092036.2504858-1-wenst@chromium.org>
Subject: Re: [PATCH] clk: tests: Add tests for clk lookup by name
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 10 Nov 2025 17:28:41 -0800
Message-ID: <176282452107.11952.13260719139557505056@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_172844_919385_1DF1E124 
X-CRM114-Status: GOOD (  30.48  )
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

Quoting Chen-Yu Tsai (2025-10-02 02:20:35)
> Clk lookup (by name) recently gained some performance improvements at
> the expense of more complexity within the lookup code.
>=20
> To make sure that this works as intended and doesn't break, add some
> basic tests for this part of the CCF.
>=20
> A new "clk_hw_lookup()" function is added purely for running kunit
> tests.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/clk/clk.c      | 11 +++++++
>  drivers/clk/clk.h      |  4 +++
>  drivers/clk/clk_test.c | 66 +++++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 80 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 85d2f2481acf..a17d0070d11f 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -778,6 +778,17 @@ struct clk *__clk_lookup(const char *name)
>         return !core ? NULL : core->hw->clk;
>  }
> =20
> +#if IS_ENABLED(CONFIG_CLK_KUNIT_TEST)
> +/* This is only provided for kunit tests to test the core lookup functio=
ns. */
> +struct clk_hw *clk_hw_lookup(const char *name)
> +{
> +       struct clk_core *core =3D clk_core_lookup(name);
> +
> +       return !core ? NULL : core->hw;
> +}
> +EXPORT_SYMBOL_GPL(clk_hw_lookup);
> +#endif

I think we can't do this ifdef because we may have some sort of build
that builds the kunit module after the kernel is built with a different
configuration. Just do the module import thing instead. I hope that
avoids this problem.

> +
>  static void clk_core_get_boundaries(struct clk_core *core,
>                                     unsigned long *min_rate,
>                                     unsigned long *max_rate)
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index a268d7b5d4cb..b3b5ce0ad897 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -175,6 +175,8 @@ static const struct clk_ops clk_multiple_parents_no_r=
eparent_mux_ops =3D {
>         .set_parent =3D clk_multiple_parents_mux_set_parent,
>  };
> =20
> +#define DUMMY_CLK_NAME "test_dummy_rate"
> +
>  static int clk_test_init_with_ops(struct kunit *test, const struct clk_o=
ps *ops)
>  {
>         struct clk_dummy_context *ctx;
> @@ -187,7 +189,7 @@ static int clk_test_init_with_ops(struct kunit *test,=
 const struct clk_ops *ops)
>         ctx->rate =3D DUMMY_CLOCK_INIT_RATE;
>         test->priv =3D ctx;
> =20
> -       init.name =3D "test_dummy_rate";
> +       init.name =3D DUMMY_CLK_NAME;
>         init.ops =3D ops;
>         ctx->hw.init =3D &init;
> =20

Please don't change existing tests in the same patch as introducing
other tests. A failure in the existing test is difficult to untangle
from the new test. Tests shouldn't be changed after they're written
either because we have to be careful that they're still correct when we
don't have tests for the tests.

> @@ -3541,6 +3543,67 @@ static struct kunit_suite clk_hw_get_dev_of_node_t=
est_suite =3D {
>         .test_cases =3D clk_hw_get_dev_of_node_test_cases,
>  };
> =20
> +/*
> + * Test that clk lookup with a name that is not registered returns NULL.
> + */
> +static void clk_lookup_not_registered_clk_returns_NULL(struct kunit *tes=
t)
> +{
> +       KUNIT_EXPECT_PTR_EQ(test, NULL, clk_hw_lookup(DUMMY_CLK_NAME));

Just write

	KUNIT_EXPECT_PTR_EQ(test, NULL, clk_hw_lookup("not_registered"));

so we don't have to look at what the definition of DUMMY_CLK_NAME is.

> +}
> +
> +/*
> + * Test that clk lookup with a name that is registered returns the clk.
> + */
> +static void clk_lookup_registered_clk_returns_clk(struct kunit *test)
> +{
> +       struct clk_hw *hw;
> +       struct clk_init_data init =3D {
> +               .name =3D DUMMY_CLK_NAME,
> +               .ops =3D &empty_clk_ops,
> +       };

Please do

	const char *clk_name =3D "valid_clk";
	struct clk_init_data init =3D {
		.name =3D clk_name,
		.ops =3D &empty_clk_ops,
	};


> +
> +       hw =3D kunit_kzalloc(test, sizeof(*hw), GFP_KERNEL);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
> +
> +       hw->init =3D &init;
> +       KUNIT_ASSERT_EQ(test, 0, clk_hw_register_kunit(test, NULL, hw));
> +
> +       KUNIT_EXPECT_PTR_EQ(test, hw, clk_hw_lookup(DUMMY_CLK_NAME));

And=20

	KUNIT_EXPECT_PTR_EQ(test, hw, clk_hw_lookup(clk_name));

so that the name is fully self contained to this function.

> +}
> +
> +/*
> + * Test that clk lookup with a name that was unregistered returns NULL.
> + */
> +static void clk_lookup_unregistered_clk_returns_NULL(struct kunit *test)
> +{
> +       struct clk_hw *hw;
> +       struct clk_init_data init =3D {
> +               .name =3D DUMMY_CLK_NAME,
> +               .ops =3D &empty_clk_ops,
> +       };
> +
> +       hw =3D kunit_kzalloc(test, sizeof(*hw), GFP_KERNEL);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
> +
> +       hw->init =3D &init;
> +       KUNIT_ASSERT_FALSE(test, clk_hw_register(NULL, hw));

Use KUNIT_ASSERT_EQ instead because clk_hw_register() doesn't return a
bool. Also, use the kunit registration function clk_hw_register_kunit()
to simplify the unregistration path which is missing here.

> +
> +       clk_hw_unregister(hw);

Before we unregister here we should assert that clk_hw_lookup() returns
non-NULL.

> +
> +       KUNIT_EXPECT_PTR_EQ(test, NULL, clk_hw_lookup(DUMMY_CLK_NAME));

Same name comment applies here as well.

> +}
> +
> +static struct kunit_case clk_lookup_test_cases[] =3D {
> +       KUNIT_CASE(clk_lookup_not_registered_clk_returns_NULL),
> +       KUNIT_CASE(clk_lookup_registered_clk_returns_clk),
> +       KUNIT_CASE(clk_lookup_unregistered_clk_returns_NULL),
> +       {}
> +};
> +
> +static struct kunit_suite clk_lookup_test_suite =3D {
> +       .name =3D "clk-lookup",
> +       .test_cases =3D clk_lookup_test_cases,
> +};
> =20
>  kunit_test_suites(
>         &clk_assigned_rates_suite,
> @@ -3560,6 +3623,7 @@ kunit_test_suites(
>         &clk_register_clk_parent_data_device_suite,
>         &clk_single_parent_mux_test_suite,
>         &clk_uncached_test_suite,
> +       &clk_lookup_test_suite,

Please keep this alphabetically sorted.

>  );
>  MODULE_DESCRIPTION("Kunit tests for clk framework");
>  MODULE_LICENSE("GPL v2");

